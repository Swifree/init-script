# install homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# 禁止brew自动更新，不然brew install会先执行brew update，由于众所周知的原因，无法科学上网，导致brew install卡在brew updating上
export HOMEBREW_NO_AUTO_UPDATE=true

# 安装各种软件

# 安装vscode并且添加命令code,可以使用code path 命令使用vscode打开文件或文件夹
brew cask install visual-studio-code; code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}&
# 默认安装不需要配置GOPATH
brew install go &

# terminal的SF Mono字体挺好看的，复制到系统字体库，iterm2也可以用这个字体了
cp -R /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/. /Library/Fonts/
brew install zsh &
# 安装完iterm2后进入Profiles -> Colors -> Color Presets选择Tango Dark,  Profiles -> Window -> Transparency调到50%左右，可好看了
brew cask install iterm2 &

brew cask install java &
brew cask install google-chrome &
brew cask install alfred &
brew cask install shadowsocksx-ng &


# 安装spf13-vim  参考https://github.com/spf13/spf13-vim
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh &
