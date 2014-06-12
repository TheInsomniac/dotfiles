#quickly add aliases to .aliases
function add-alias() {
    echo "alias $1=\"${@:2:$#}\"" >> $HOME/.aliases;
    source $HOME/.aliases;
    alias alias-add="add-alias"
}

# batch change extension (chgext FROM TO)
function chgext() {
   for file in *.$1 ; do mv "$file" "${file%.$1}.$2" ; done
}

# Make backup of file (mkbak FILENAME)
function mkbak() {
  for file in $1; do cp "$file" "$file".bak; done
}

# Copy origfile.ext to origfile.newext (mkcp FILENAME.EXT .NEWEXT)
function mkcp() {
  for file in $1; do cp "$file" "${file%%.*}$2"; done
}

#make directory and then cd into it
function md() {
    mkdir -p "$*"
    cd "$*"
}

#setup webdev environment
function webdev() {
  read -n1 -p "Scaffold web development into directory: ${PWD##*/}? (y/n) "
  echo
  [[ $REPLY = [yY] ]] && setup_webdev || { echo "Installation Cancelled..."; }
}
function setup_webdev() {
  if [ ! -d assets ]; then
    mkdir -p "assets/css assets/less assets/sass assets/css assets/img assets/js assets/js/vendor"
  fi
  cp ~/dotfiles/webdev/* .
  mv {,.}bowerrc
  mv {,.}jshintrc
  mv {,.}jsbeautifyrc
  mv {,.}editorconfig
  mv {,.}gitignore
  mv {,.}csscomb.json
  mv {,.}scss-lint.yml
  npm install
  git init
  echo "Edit gulpfile.js to suit the needs/directory structure of your project"
}

### Create Github repo from command line
github-create() {
  repo_name=$1

  dir_name=`basename $(pwd)`

  if [ "$repo_name" = "" ]; then
    echo "Repo name (hit enter to use '$dir_name')?"
    read repo_name
  fi

  if [ "$repo_name" = "" ]; then
    repo_name=$dir_name
  fi

  username=`git config user.name`
  if [ "$username" = "" ]; then
    echo "Could not find username, run 'git config --global github.user <username>'"
    invalid_credentials=1
  fi

  token=`git config github.token`
  if [ "$token" = "" ]; then
    echo "Could not find token, run 'git config --global github.token <token>'"
    invalid_credentials=1
  fi

  if [ "$invalid_credentials" == "1" ]; then
    return 1
  fi

  echo -n "Creating Github repository '$repo_name' ..."
  curl -u "$username:$token" https://api.github.com/user/repos -d '{"name":"'$repo_name'"}' > /dev/null 2>&1
  echo " done."

  echo -n "Pushing local code to remote ..."
  git remote add origin git@github.com:$username/$repo_name.git > /dev/null 2>&1
  git push -u origin master > /dev/null 2>&1
  echo " done."
}
