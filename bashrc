# If not running interactively, don't do anything
[ -z "$PS1" ] && return
[[ $- != *i* ]] && return

# Ensure /usr/local/bin is before /usr/bin
export PATH=/usr/local/bin:$PATH

#disable messages from other users
mesg n

# enable Mac OSX specific bash settings
if [ -f $HOME/.bashrc_osx ] && [[ "$OSTYPE" =~ ^darwin ]]; then
    . $HOME/.bashrc_osx
fi

# Set default editor to vi for programs such as cron
EDITOR=$(which vi)

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
YELLOW=$(tput setaf 3)
WHITE=$(tput setaf 7)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)
BOLD=$(tput bold)

## Simple git branch prompt if not using git-prompt.bash
#function parse_git_branch {
#   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
#}
#PS1='[\u@\h][\[$BLUE\]\w\[$RESET\]]\n\[$MAGENTA\]$(parse_git_branch)\[$RESET\]→ '

## More complex git branch prompt including dirty/clean state. Uses git-prompt.bash
#PS1='[\u@\h][\[$BLUE\]\w\[$RESET\]]\n\[$MAGENTA\]$(__git_ps1 "[%s]")\[$RESET\]→ '

#PS1='\[$BLUE\]\w\[$RESET\] \[$BLACK\]$(__git_ps1 "(%s)")\[$RESET\]\n\[$CYAN\]❯\[$RESET\] '
# Add time when prompt was displayed. Useful to figure out when I ran something
# last
#PS1="[\t] $PS1"
#or combine them :)
PS1='[\[$BOLD\]\[$BLACK\]\t\[$RESET\]] \[$BLUE\]\w\[$RESET\] \[$BLACK\]$(__git_ps1 "(%s)")\[$RESET\]\n\[$MAGENTA\]❯\[$RESET\] '

#Add [hostname] to prompt when logged in via ssh:
if [ -n "$SSH_CLIENT" ]; then
  PS1="[\h] $PS1"
fi

## Display size of terminal window in iTerm2 if on my laptop.
## Useful when I want to ensure my terminal is 80x24 for proper code layout.
if [[ "$HOSTNAME" = "lappy" ]]; then
  PROMPT_COMMAND='echo -ne "\033]0;[$LINES:$COLUMNS][${PWD/#$HOME/~}]\007"'
else
  PROMPT_COMMAND='echo -ne "\033]0;[$HOSTNAME][${PWD/#$HOME/~}]\007"'
fi

export CLICOLOR=1
export SOLARIZED="dark"

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias ls="command ls -G"
else
  if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/dotfiles/dircolors.ansi-$SOLARIZED && eval `dircolors $HOME/dotfiles/dircolors.ansi-$SOLARIZED`
    alias ls='ls --color=auto'
  fi
fi
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

# Enable Less' syntax highlighting on Linux
if [ -d /usr/share/source-highlight ]; then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
    export LESS=' -R '
fi
# Enable Less' syntax highlighting on OSX
if [ -d /usr/local/share/source-highlight ]; then
    export LESSOPEN="| /usr/local/share/source-highlight/src-hilite-lesspipe.sh %s"
    export LESS=' -R '
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# disable XON/XOFF in terminal to allow C-s forward bash search
stty -ixon

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
    export WORKON_HOME=$HOME/PyEnvs
    export PROJECT_HOME=$HOME/Projects
    source /usr/local/bin/virtualenvwrapper.sh
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    workon_virtualenv() {
        if [ -e .venv ]; then
            #current_dir="${PWD##*/}"
            current_dir_root="${PWD}"
            deactivate > /dev/null 2>&1
            workon "$(cat .venv)"
            #if [ -e $HOME/Envs/$current_dir ]; then
                #deactivate >/dev/null 2>&1
                #workon ${PWD##*/}
            ##fi
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

#Enable NODE.js virtualenv (nvm)
if [ -x $HOME/NodeEnvs/nvm.sh ]; then
    export NVM_DIR=$HOME/NodeEnvs
    source $HOME/NodeEnvs/nvm.sh
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
if [ -f $HOME/.git-prompt.bash ]; then
  source $HOME/.git-prompt.bash
  #GIT_PS1_SHOWUNTRACKEDFILES='True'
  GIT_PS1_SHOWDIRTYSTATE='True'
fi

# $HOME/.aliases, instead of adding more of them here directly.
if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi

# if $HOME/.ssh_aliases, import ssh aliases
if [ -f $HOME/.ssh_aliases ]; then
    . $HOME/.ssh_aliases
fi

# import bash functions
if [ -f $HOME/.bash-functions.bash ]; then
  . $HOME/.bash-functions.bash
fi

# enable bash completion
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
elif [ -f $HOME/.git-completion.bash ]; then
    . $HOME/.git-completion.bash
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# enable autojump if installed for OSX
if [ -f /usr/local/etc/autojump.sh ]; then
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh ]]
# enable autojump if installed for Linux
elif [ -f /usr/local/bin/autojump ]; then
    [[ -s /etc/profile.d/autojump.bash ]] && . /etc/profile.d/autojump.bash
fi

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
