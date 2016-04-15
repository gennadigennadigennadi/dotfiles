# install brew
echo Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install zsh shell and set default
echo Install zsh-shell
brew install zsh
chsh -s /usr/local/bin/zsh