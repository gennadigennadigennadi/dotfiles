#!/bin/bash
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# install versions
echo "Install Cask/Versions"
brew tap caskroom/versions

echo "Install Caskroom/Cask"
# install cask
brew tap caskroom/cask
brew install brew-cask

apps=(
    'google-chrome'
    'macpass'
    'dropbox'
    'iterm22'
    'virtualbox'
    'sublime-text3'
    'sourcetree'
    'spotify'
    'forklift'
)

echo "Install Core Apps"
for app in ${apps[*]}
do
    brew cask install $app
done

echo "cleanu cask"
brew cask cleanup
