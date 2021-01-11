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
    'iterm2'
    'docker'
    'postman'
    'clipy'
    'font-jetbrains-mono-nerd-font'
    'fork'
    'phpstorm'
    'tableplus'
    'visual-studio-code'
    'slack'
    'zoom'
)

echo "Install Core Apps"
for app in ${apps[*]}
do
    brew cask install $app
done

echo "cleanu cask"
brew cask cleanup
