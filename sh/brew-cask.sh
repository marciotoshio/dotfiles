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
# brew tap caskroom/versions # install beta versions with Cask
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
brew cask install alfred
brew cask install atom
brew cask install dropbox
brew cask install evernote
brew cask install flux
brew cask install google-chrome
brew cask install google-drive
brew cask install imageoptim
brew cask install java
brew cask install kdiff3
brew cask install obs
brew cask install postman
brew cask install remote-play
brew cask install shuttle
brew cask install skype
brew cask install slack
brew cask install spectacle
brew cask install spotify
brew cask install steam
brew cask install sublime-text
brew cask install sequel-pro
brew cask install transmission
brew cask install vagrant
brew cask install virtualbox

###############################################################################
# Launch apps from Alfred
###############################################################################
# echo "Homebrew Cask: linking apps to Alfred..."
# brew cask alfred link


###############################################################################
# Copy application preferences & config files with Mackup
###############################################################################
# echo "Mackup: restoring application preferences..."
# mackup restore


###############################################################################
# Cleanup
###############################################################################
brew cask cleanup
echo "macOS Apps Done Setup!"
