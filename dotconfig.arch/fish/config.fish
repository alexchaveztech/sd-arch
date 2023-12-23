if status is-interactive
    # Commands to run in interactive sessions can go here
    # Aliases
	alias ..='cd ..' 
	alias ...='cd ../..' 
	alias install='sudo pacman -S'
	alias update='sudo pacman -Syu'
	alias upgrade='sudo pacman -Syyu'
	alias l='exa -ll --color=always --group-directories-first'
	alias ls='exa -al --header --icons --group-directories-first'
	alias df='df -h'
	alias free='free -h'
	alias reload='source ~/.bashrc'
	alias v='nvim'
	alias gc='git clone'
	alias rm='trash-put -vf -- '
	alias rmu='trash-restore -v'
	alias help='tldr'

	# Clip menu variables
	set --export CM_HISTLENGTH 8
	set --export CM_LAUNCHER rofi

	neofetch
end
