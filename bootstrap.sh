#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  if [ -d ~/.rvm ]; then
    echo "RVM installed"
  else
      echo "Installing RVM"
      gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
      \curl -sSL https://get.rvm.io | bash
  fi;

  if [ -d ~/.oh-my-zsh ]; then
      echo "Oh My Zsh installed"
  else
      echo "Installing Oh My Zsh"
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi;

  rsync --exclude ".git/" \
    --exclude "init/" \
    --exclude "sh/" \
    --exclude ".DS_Store" \
    --exclude ".osx" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE-MIT.txt" \
    -avh --no-perms . ~;

  source ~/.zshrc;

  ###############################################################################
  # Sublime Text                                                                #
  ###############################################################################

  # Install Sublime Text settings
  echo "Copying Sublime preferences"
  cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/ 2> /dev/null
  cp -r init/Markdown.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/ 2> /dev/null
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
