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
brew install caskroom/cask/brew-cask # install Cask
brew tap caskroom/fonts # install fonts with Cask


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
brew cask install dropbox
brew cask install evernote
brew cask install filezilla
brew cask install google-drive
brew cask install java
brew cask install kdiff3
brew cask install obs
brew cask install postman
brew cask install remote-play
brew cask install skype
brew cask install steam
brew cask install sublime-text
brew cask install docker

###############################################################################
# Cleanup
###############################################################################
brew cask cleanup
echo "macOS Apps Done Setup!"
