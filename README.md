# 💾 Dotfiles

These are my dotfiles. I use bash, vim and git in my daily workflow.

## Installation

- `cd ~`
- `git clone https://github.com/khansubhan95/dotfiles.git ~/.dotfiles`
- `source ~/.dotfiles/install.sh`

## Vim

The vim plugins are installed as part of executing install.sh . I use Pathogen to load the vim plugins to vim  There is a update.sh script in .vim/ that gets run when you run install.sh . Whenever you want to install a new plugin, add it's GitHub repo path to repos in .vim/update.sh and run update.sh. 

### Inspiration

- [https://github.com/statico/dotfiles](https://github.com/statico/dotfiles)