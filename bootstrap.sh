#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
  if [ -d /home/linuxbrew/.linuxbrew ] || [ -d /opt/homebrew ]; then
    echo "Homebrew installed"
  else
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >> ~/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi;

  if [ -f ~/.zshrc ]; then
    echo "zsh installed"
  else
      echo "Installing zsh"
      brew install zsh

      echo >> ~/.zshrc
      echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi;

  if [ -d ~/.oh-my-zsh ]; then
      echo "Oh My Zsh installed"
  else
      echo "Installing Oh My Zsh"
      /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi;

  if [ brew --prefix rbenv &>/dev/null; ]; then
    echo "rbenv installed"
  else
      echo "Installing rbenv"
      brew install rbenv
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
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1 -r
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
