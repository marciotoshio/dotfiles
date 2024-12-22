#!/usr/bin/env zsh

set -e

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
  if [ -d ~/.rvm ]; then
    echo "RVM installed"
  else
      echo "Installing RVM"
      gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
      \curl -sSL https://get.rvm.io | bash
  fi;

  if [ -d ~/.oh-my-zsh ]; then
      echo "Oh My Zsh installed"
  else
      echo "Installing Oh My Zsh"
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi;

  rsync --exclude ".git/" \
    --exclude "sh/" \
    --exclude ".DS_Store" \
    --exclude ".osx" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE-MIT.txt" \
    -avh --no-perms . ~;
  echo "Rsynced dot files"
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
  doIt;
else
  read "REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) "
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
