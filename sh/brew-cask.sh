#!/bin/bash

###############################################################################
# setup-apps
#
# A shell script to automate application setup on Mac OS X.
###############################################################################


###############################################################################
# Install fonts and applications with Homebrew cask
###############################################################################
echo "Homebrew: installing Homebrew Cask..."
brew install svn
brew tap homebrew/cask-fonts # install fonts with Cask


###############################################################################
# Install fonts with Homebrew Cask
###############################################################################
echo "Homebrew Cask: installing fonts..."
fonts=(
  font-source-sans-pro
  font-input
  font-roboto
)
brew cask install ${fonts[@]}


###############################################################################
# Install applications with Homebrew Cask
###############################################################################
echo "Homebrew Cask: installing apps..."
brew cask install google-backup-and-sync
brew cask install kdiff3
brew cask install obs
brew cask install postman
brew cask install steam
brew cask install sublime-text
brew cask install docker
brew cask install hyper

###############################################################################
# Cleanup
###############################################################################
brew cleanup
echo "macOS Apps Done Setup!"
