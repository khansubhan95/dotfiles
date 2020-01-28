# Setting environment variables
export PS1="[\u@\h \W]\$ "
export HISTSIZE=10000

# Aliases
alias desk='cd ~/Desktop'
alias :wq='exit'
alias ll='ls -la'
alias grep='grep --color=auto'
alias gaa='git add --all'
alias gcmsg='git commit -m'
alias ggp='git push origin $(git_current_branch)'
alias gcl='git clone'

alias bashconfig='gvim ~/.bashrc'
alias vimconfig='gvim ~/.vim/vimrc'

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
# export LSCOLORS=GxFxCxDxBxegedabagaced
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# export LSCOLORS=ExFxCxDxBxegedabagacad


# Color man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.bash ]; then
  source /usr/local/opt/fzf/shell/key-bindings.bash
  source /usr/local/opt/fzf/shell/completion.bash
fi

# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.bash
  source ~/.fzf/shell/completion.bash
fi

# Run z
. ~/.dotfiles/z/z.sh
