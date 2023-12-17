#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Optimize DNF Configuration
echo "Optimizing DNF"
sh -c 'echo "max_parallel_downloads=10" >>/etc/dnf/dnf.conf'
sh -c 'echo "fastestmirror=True" >>/etc/dnf/dnf.conf'
sh -c 'echo "defaultyes=True" >>/etc/dnf/dnf.conf'
sed -i 's/installonly_limit=3/installonly_limit=2/' /etc/dnf/dnf.conf

# Update system
echo "===Updating System Sofware==="
dnf update -y
dnf upgrade -y

# Update Firmware
echo "===Updating System Firmware==="
fwupdmgr get-devices 
fwupdmgr refresh --force
fwupdmgr get-updates
fwupdmgr update

# Upgrade hardware
echo "===Refreshing Hardware System==="
dnf upgrade --refresh
dnf groupupdate -y core

# Enable RPM Fusion
echo "===Enabling RPM Fusion==="
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install Nvidia Drivers
echo "===Install Nvidia Drivers==="
dnf install -y akmod-nvidia
dnf install -y xorg-x11-drv-nvidia-cuda
dnf install -y nvidia-vaapi-driver libva-utils vdpauinfo

# Make .config and place config files. Place resource files where needed.
echo "===Restoring System Configuration and settings==="
cd $builddir
mkdir -p /home/$username/.config
cp -R dotconfig/* /home/$username/.config/
cp resources/xorg.conf /etc/X11/
cp resources/alex.face.icon /usr/share/sddm/faces/
chown -R $username:$username /home/$username

# Install SDDM copy config. Create wallpaper directory and place wallpaper
echo "===Installing SDDM, Configure and Installing Login Theme==="
dnf install -y sddm
systemctl enable sddm.service -f

cp resources/sddm.conf /etc/sddm.conf.d/
mkdir -p /usr/share/backgrounds/
cp resources/rockymountain.jpg /usr/share/backgrounds/

# Install Sugar Candy SDDM Login Theme
tar -xzvf resources/sugar-candy.tar.gz -C /usr/share/sddm/themes
cp resources/sugar-candy-theme.conf /usr/share/sddm/themes/sugar-candy/theme.conf


# Install essential packages
echo "===Installing Essential Software==="
dnf install -y picom fish kitty rofi neovim trash-cli tldr exa neofetch wl-clipboard autojump flameshot mangohud unzip p7zip p7zip-plugins unrar bat lxappearance locate pv xautolock

# Install Brave browser
echo "===Installing Extra Software: Browser, File Editor==="
dnf install -y dnf-plugins-core
dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
dnf install -y brave-browser brave-keyring

# Install LF File manager
dnf copr enable pennbauman/ports
dnf install -y lf

# Enable flathub remote
echo "===Enabling Flatpak and install Spotify==="
dnf install -y platpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --enable flathub
flatpak install flathub com.spotify.Client

# Install clipmenu (clip board plugin) for rofi
echo "===Install clipmenu==="
dnf copr enable skidnik/clipmenu
dnf install -y clipmenu
systemctl --user enable --now clipmenud

# Install build essentials package and nvim dependencies
echo "===Installing Development Tools==="
dnf group install -y "C Development Tools and Libraries" "Development Tools"
dnf install -y python3-pip git
pip3 install pynvim

# Intall optional packages
echo "===Installing Optional Packages==="
dnf install -y geany neomutt lynx

# Install fonts and reload font cache
echo "===Installing Fonts, Icon and Prompt Themes==="
cd $builddir
dnf install -y fira-code-fonts
dnf install -y cascadia-code-fonts
dnf install -y adobe-source-code-pro-fonts
dnf install -y mozilla-fira-mono-fonts

dnf copr enable zawertun/hack-fonts -y
dnf install -y hack-fonts

fc-cache -vf

# Install GDK Maerial-Black Desktop Theme
tar -xzvf resources/Material-Black-Blueberry-2.9.9.tar -C /usr/share/themes

# Install papirus icon
dnf install -y papirus-icon-theme

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh

########################################################
# End of script for default config
########################################################
printf "\e[1;32mAll done! You can now reboot!\e[0m\n"
