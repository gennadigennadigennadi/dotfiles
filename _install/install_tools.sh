# install tools

tools=(
    'the_silver_searcher'
    'git'
    'nvim'
    'vim'
    'node'
    'php53'
    'php53-xdebug'
    'php53-imagick'
    'php56'
    'php56-opcache'
    'php56-redis'
    'php56-xdebug'
    'php56-gmagick'
    'php56-mcrypt'
    'brew-php-switcher'
    'httpd24'
    'mysql'
    'imagemagick'
    'graphicsmagick'
    'redis'
    'libsass'
    'sassc'
    'composer'
    'node'
)

echo "Install Core tools"
for tool in ${tools[*]}
do
    brew install $tool
done

echo "cleanup"
brew cleanup