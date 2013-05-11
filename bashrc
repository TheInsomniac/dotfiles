# enable Mac OSX specific bash settings
if [ -f $HOME/.bashrc_osx ]; then
    . $HOME/.bashrc_osx
fi

# Set default editor to vi for programs such as cron
EDITOR=vi

#RED=$(tput setaf 1)
#GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
#YELLOW=$(tput setaf 3)
#WHITE=$(tput setaf 7)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

#PS1="[\u@\h \w\[$MAGENTA\]\$(__git_ps1)\[$RESET\]]\$ "
#PS1='┌─[\u@\h][\[$BLUE\]\w\[$RESET\]]\n└─[\[$MAGENTA\]$(__git_ps1)\[$RESET\]\$] '
PS1='[\u@\h][\[$BLUE\]\w\[$RESET\]]\n\[$MAGENTA\]$(__git_ps1 "[%s]")\[$RESET\]→ '

export CLICOLOR=1

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias ls="command ls -G"
else
  if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
  fi
fi
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# disable XON/XOFF in terminal to allow C-s forward bash search
if [ -t 0 ]; then 
    stty -ixon
fi

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable bash 4's autocd
shopt -s autocd

# enable readline vi mode instead of default of emacs
set -o vi

#enable Python VirtualEnv
if [ -x /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/Envs
    export PROJECT_HOME=$HOME/Projects
    source /usr/local/bin/virtualenvwrapper.sh
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
fi

# Python Startup file
if [ -f $HOME/.pythonstartup.py ]; then
    export PYTHONSTARTUP="$HOME/.pythonstartup.py"
fi

# Add ruby's RVM into the shell as a function
if [ -d $HOME/.rvm ]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

#enable git prompt
source $HOME/.git-prompt.bash

# Recursively delete `.pyc` files
alias rmpyc="find . -type f -name '*.pyc' -ls -delete"

# $HOME/.aliases, instead of adding more of them here directly.
if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi

# if $HOME/.ssh_aliases, import ssh aliases
if [ -f $HOME/.ssh_aliases ]; then
    . $HOME/.ssh_aliases
fi

#quickly add aliases to .aliases
function add-alias() {
    echo "alias $1=\"${@:2:$#}\"" >> $HOME/.aliases;
    source $HOME/.aliases;
}

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
else
    . /etc/bash_completion
fi

if [ -f $HOME/.git-completion.bash ]; then
    . $HOME/.git-completion.bash
fi

# Automatically "workon" Python virtualenv and deactivate when leaving.
if [ -x /usr/local/bin/virtualenvwrapper.sh ]; then
    workon_virtualenv() {
        if [ -e .venv ]; then
            current_dir="${PWD##*/}"
            current_dir_root="${PWD}"
            if [ -e $HOME/Envs/$current_dir ]; then
                deactivate >/dev/null 2>&1
                workon ${PWD##*/}
            fi
        fi
        if [[ $PWD/ != $current_dir_root/* ]]; then
        deactivate >/dev/null 2>&1
        fi
    }
    virtualenv_cd() {
        cd "$@" && workon_virtualenv
    }
    alias cd="virtualenv_cd"
fi

