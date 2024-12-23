#!/usr/bin/env bash

###############################################################################
# Install Xcode command line tools
###############################################################################
echo "Installing Xcode Command Line Tools..."
xcode-select --install

###############################################################################
# Check for Homebrew, else install
###############################################################################
echo "Checking for, or Installing Homebrew..."
if [ -z `command -v brew` ]; then
    echo "Brew is missing! Installing it..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi;

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
echo "Homebrew: updating..."
brew update

# Upgrade any already-installed formulae.
echo "Homebrew: upgrading..."
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
echo "Homebrew: installing utilities..."
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
echo "Homebrew: installing some macOS tools..."
brew install homebrew/grep
brew install homebrew/openssh
brew install homebrew/screen

# Install font tools.
echo "Homebrew: installing font tools..."
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#echo "Homebrew: installing CTF tools..."
#brew install aircrack-ng
#brew install bfg
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf
#brew install xz

# Install other useful binaries.
echo "Homebrew: installing some useful binaries..."
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
# brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
# brew install vbindiff
# brew install webkit2png
brew install zopfli
brew install zsh
brew install docker

echo "Setting zsh as default shell"
chsh -s $(which zsh)

#Install RVM and Ruby
# Install GPG
brew install gpg
# RVM key
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#Install RVM with latest ruby
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Remove outdated versions from the cellar.
echo "Homebrew: cleaning up..."
brew cleanup

echo "Please restart your shell."
