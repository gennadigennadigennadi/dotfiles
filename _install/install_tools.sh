# install tools

tools=(
    'git'
    'nvim'
    'composer'
    'node'
    'php'
    'mysql'
    'jq'
    'python'
)

echo "Install Core tools"
for tool in ${tools[*]}
do
    brew install $tool
done

echo "cleanup"
brew cleanup
