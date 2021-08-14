#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  rsync --exclude ".git/" \
    --exclude "init/" \
    --exclude "sh/" \
    --exclude ".DS_Store" \
    --exclude ".osx" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE-MIT.txt" \
    -avh --no-perms . ~;

  # link .zsh_history from Google Drive
  SOURCE_FILE=~/Google\ Drive/Settings/.zsh_history
  LINK_NAME=/Users/tosha/.zsh_history

  if [[ -f "$SOURCE_FILE" ]]; then
      rm -f $LINK_NAME
      ln -fs $SOURCE_FILE $LINK_NAME
      echo "History file link created."
      ls -la $LINK_NAME
  else
    echo "History file does not exist: $SOURCE_FILE"
    echo "Run again after setting up Google Backup and Sync service."
  fi

  source ~/.profile;

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
