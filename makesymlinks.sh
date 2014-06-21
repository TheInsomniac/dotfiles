#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="bashrc bashrc_osx aliases shell-functions git-completion.bash git-prompt.bash vimrc \
    vim nanorc hushlogin inputrc osx_defaults pythonstartup.py mutt \
    ipython screenrc tmux.conf jshintrc dircolors.ansi-light jshintrc \
    jsbeautifyrc editorconfig lessfilter csscomb.json docker-completion.bash \
    zshrc zshrc_osx theinsomniac.zsh-theme"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Copy shell scripts
if [[ "$OSTYPE" =~ ^darwin ]]; then
  cp -Rp $dir/scripts /usr/local/bin
fi

# Copy geektool script only if OS is MAC OSX
if [[ "$OSTYPE" =~ ^darwin ]]; then
    ln -s $dir/geektool ~/geektool
fi

#Copy quicklook files if OS is MAC OSX
if [[ "$OSTYPE" =~ ^darwin ]]; then
    ln -s $dir/QuickLook ~/Library/QuickLook
    /usr/bin/qlmanage -r
    # Enable select/copy/paste in quicklook
    defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder
fi

# Copy virtualenvwrapper postactivate script if virtualenvwrapper installed
if [[ -n "$WORKON_HOME" ]]; then
    mv $WORKON_HOME/postactivate $WORKON_HOME/postactivate.orig
    ln -s $dir/postactivate $WORKON_HOME/postactivate
    mv $WORKON_HOME/postdeactivate $WORKON_HOME/postdeactivate.orig
    ln -s $dir/postdeactivate $WORKON_HOME/postdeactivate
fi
