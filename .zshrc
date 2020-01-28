# source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

alias zshconfig="gvim ~/.zshrc"
alias ohmyzsh="gvim ~/.oh-my-zsh"

alias vimconfig="gvim ~/.vim/vimrc"
alias desk='cd ~/Desktop'
alias :wq='exit'
alias pip='pip3'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ~/z.sh
#
export PATH=${PATH}:/usr/local/mysql/bin/ 
