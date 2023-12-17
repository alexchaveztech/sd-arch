if status is-interactive
    # Commands to run in interactive sessions can go here
    # Aliases
	alias ..='cd ..' 
	alias ...='cd ../..' 
	alias update='sudo pacman -Syu'
	alias upgrade='sudo pacman -Syyu'
	alias l='exa -ll --color=always --group-directories-first'
	alias ls='exa -al --header --icons --group-directories-first'
	alias df='df -h'
	alias free='free -h'
	# alias '?'='lynx duckduckgo.com'
	# alias '??'=google
	# Dotfiles & Files
	alias reload='source ~/.bashrc'
	alias v='nvim'
	alias gc='git clone'
	alias rm='trash-put -vf -- '
	alias rmu='trash-restore -v'
	alias help='tldr'

	# Clip menu variables
	set --export CM_HISTLENGTH 8
	set --export CM_LAUNCHER rofi

	zoxide init fish | source
	starship init fish | source
	neofetch
end
