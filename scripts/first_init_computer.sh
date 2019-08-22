#!/bin/bash

# colors
export RED='\033[1;31m'
export GREEN='\033[1;32m'
export YELLOW='\033[1;33m'
export BLUE='\033[1;34m'
export NC='\033[0m'


CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Update all package !
sudo apt-get update

# Install git
sudo apt-get install -y git

# Install meld for git merge
sudo apt-get install -y meld

# Install terminator
sudo apt-get install -y terminator

# Install sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

# Install ssh
sudo apt-get install ssh

# Install zsh
sudo apt-get install -y zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install dark gitk from https://draculatheme.com/gitk/
git clone https://github.com/dracula/gitk.git
mkdir -p ~/.config/git
cp gitk/gitk ~/.config/git/

# Install autosuggestion plugin for zsh
cd ~/.oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git

# install powerline for zsh font
sudo apt-get install -y powerline

# Install fzf
cd ~ 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install vim
sudo apt-get install -y vim
sudo apt-get install -y vim-gnome

# Misc management
cd ${CURRENT_DIR}
cp ../configs/home/.bash_aliases ~/.bash_aliases
cp ../configs/home/.bashrc ~/.bashrc
cp ../configs/home/.gitconfig ~/.gitconfig
cp ../configs/home/.git-prompt.sh ~/.git-prompt.sh
cp ../configs/home/.minirc.dfl ~/.minirc.dfl
cp ../configs/home/.zshrc ~/.zshrc

# Zsh custom theme
cp ../configs/home/.oh-my-zsh/custom/themes/guigui.zsh-theme ~/.oh-my-zsh/custom/themes/

# Terminator theme
mkdir -p ~/.config/terminator
cp ../configs/home/.config/terminator/config ~/.config/terminator/

# Sublime use keybind
mkdir -p ~/.config/sublime-text-3/Packages/User
cp "../configs/home/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap" ~/.config/sublime-text-3/Packages/User/

# Vim init
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Vim rc init
cp ../configs/home/.vimrc ~/

echo -e "${RED}Force theme update for gruvbox ${NC}"
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
cp ~/.vim/bundle/gruvbox/colors/gruvbox.vim /usr/share/vim/vim74/colors/
