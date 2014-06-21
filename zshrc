# If not running interactively, don't do anything
[ -z "$PS1" ] && return
[[ $- != *i* ]] && return

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change history to display day/month/year
HIST_STAMPS="dd/mm/yyyy"

# Enabled oh-my-zsh plugins
plugins=(gitfast docker vagrant brew brew-cast virtualenvwrapper npm autojump rvm)

source $ZSH/oh-my-zsh.sh

# Set oh-my-zsh theme
source $HOME/.theinsomniac.zsh-theme

export PATH=/usr/local/bin:$PATH

# enable Mac OSX specific bash settings
if [ -f $HOME/.zshrc_osx ] && [[ "$OSTYPE" =~ ^darwin ]]; then
    . $HOME/.zshrc_osx
fi

#disable messages from other users
mesg n

# Set default editor to vi for programs such as cron
EDITOR=$(which vi)

# Enable Less' syntax highlighting on Linux
if [ -d /usr/share/source-highlight ]; then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
    export LESS=' -R '
# Enable Less' syntax highlighting on OSX
elif [ -d /usr/local/share/source-highlight ]; then
    export LESSOPEN="| /usr/local/share/source-highlight/src-hilite-lesspipe.sh %s"
    export LESS=' -R '
fi

# Python Startup file
if [ -f $HOME/.pythonstartup.py ]; then
    export PYTHONSTARTUP="$HOME/.pythonstartup.py"
fi

# $HOME/.aliases, instead of adding more of them here directly.
if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi

# import shell functions
if [ -f $HOME/.shell-functions ]; then
  . $HOME/.shell-functions
fi
