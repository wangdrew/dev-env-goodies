#!/bin/bash

# Assumes macos
if ! [[ "$OSTYPE" == "darwin"* ]]; then
	print "only macOS is supported now"
	exit
fi

# assert wget is installed
brew list carthage &>/dev/null || brew install carthage

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install my fav theme
mkdir -p ~/.oh-my-zsh/custom/themes/
curl -L https://git.io/v5ohc -o ~/.oh-my-zsh/custom/themes/aphrodite.zsh-theme
sed -i.bak 's/^[[:space:]]*ZSH_THEME=.*/ZSH_THEME="aphrodite"/' ~/.zshrc
source ~/.zshrc

# iterm color themes: Dracula
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Dracula.itermcolors -o ~/.oh-my-zsh/custom/Dracula.itermcolors
open ~/.oh-my-zsh/custom/Dracula.itermcolors

# iterm regular font: 12pt Meslo LG S Regular for Powerline
# iterm non-ascii font: 12pt Meslo LG S Regular for Powerline
git clone https://github.com/powerline/fonts ~/.oh-my-zsh/custom/powerline-fonts
open ~/.oh-my-zsh/custom/powerline-fonts
