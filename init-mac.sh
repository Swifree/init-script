
# 当配置不存在时添加配置到~/.bash_profile
addConfigIFNX()
{
    echo $1
    f=~/.bash_profile
    touch $f
    if [ $(fgrep -c $1 $f) -eq 0 ]
    then 
        echo $1 >> $f
    fi
    #配置立即生效
    source $f
}
# 判断函数是否存在
notFound()
{
    type $1 | grep -c 'not found'
} 
# 安装homebrew
if [ $(notFound brew) -gt 0 ]
then 
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/versions
fi

# 禁止brew自动更新，不然brew install会先执行brew update，由于众所周知的原因，无法科学上网，导致brew install卡在brew updating上
addConfigIFNX 'export HOMEBREW_NO_AUTO_UPDATE=true'

# 安装vscode并且添加命令code,可以使用code path 命令使用vscode打开文件或文件夹
brew cask install visual-studio-code &

# 如果没安装go，安装go
if [ $(notFound go) -gt 0 ]
then 
    brew install go
    addConfigIFNX 'export GOPATH=~/go'
fi &

# terminal的SF Mono字体挺好看的，复制到系统字体库，iterm2也可以用这个字体了
cp -R /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/. /Library/Fonts/
# 如果没安装zsh, 安装zsh
if [ $(notFound zsh) -gt 0 ]
then 
    brew install zsh; 
    echo '. ~/.bash_profile' >> ~/.zshrc
fi &
# 安装完iterm2后进入Profiles -> Colors -> Color Presets选择Tango Dark
# 然后进入Profiles -> Window -> Transparency调到50%左右，可好看了,colomns:170,rows:100
# Profiles -> Text 12pt SF Mono Semibold， Keys-> hotkey设置唤起iterm的快捷键，我一般用cmd + option + t
brew cask install iterm2 &

brew cask install java8
addConfigIFNX 'export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home'

if [ $(notFound mvn) -gt 0 ]
then 
    brew install maven
fi &

brew cask install google-chrome &
brew cask install shadowsocksx-ng &

