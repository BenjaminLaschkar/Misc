#!/bin/bash

# colors
export RED='\033[1;31m'
export GREEN='\033[1;32m'
export YELLOW='\033[1;33m'
export BLUE='\033[1;34m'
export NC='\033[0m'

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function show_help() {
    echo "Usage:

    ${0##*/} [-a][-d][-h]

    Options:
        -a, --install-all
            install all relevant package

        -d, --deploy-config
            deploy the configuration

        -h, --help
            display this help and exit
    "
}


function check_error() {
    if [ "$1" = "0" ]
    then
        # Print success if build is success
        echo -e "${GREEN}$2 -> SUCCESS${NC}"
        return 0
    else
        # If make error print error and exit with error code 5
        echo -e "${RED}$2 -> ERROR ${NC}"
        return $1
    fi
}


OPTIONS=adh
LONGOPTS=help,install-all,deploy-config
! PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTS --name "$0" -- "$@")
if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
    exit 2
fi
a=0
d=0
h=0
# default behavior: enable all options
if [[ $# -eq 0 ]]; then
    a=1
    d=1
fi
eval set -- "$PARSED"
while true; do
    case "$1" in
        -a|--install-all)
            a=1
            shift
            ;;
        -d|--deploy-config)
            d=1
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done


# --- Install all ---
if [ $a -eq 1 ];
then
    echo -e "${BLUE}----------- INSTALL ALL ----------------${NC}"

    echo -e "${BLUE} - Update package ${NC}"
	sudo apt-get update
	check_error $? $_

	echo -e "${BLUE} - Install git ${NC}"
	sudo apt-get install -y git
	check_error $? $_

	echo -e "${BLUE} - Install meld for git merge ${NC}"
	sudo apt-get install -y meld
	check_error $? $_

	echo -e "${BLUE} - Install terminator ${NC}"
	sudo apt-get install -y terminator
	check_error $? $_

	echo -e "${BLUE} - Install ssh ${NC}"
	sudo apt-get install ssh
	check_error $? $_

	echo -e "${BLUE} - Install zsh ${NC}"
	sudo apt-get install -y zsh
	check_error $? $_
	sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	check_error $? $_

	echo -e "${BLUE} - Install powerline for zsh font ${NC}"
	sudo apt-get install -y powerline
	check_error $? $_

	echo -e "${BLUE} - Install fzf ${NC}"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	check_error $? $_
	~/.fzf/install
	check_error $? $_

	echo -e "${BLUE} - Install vim ${NC}"
	sudo apt-get install -y vim
	check_error $? $_

	echo -e "${BLUE} - Install vim-gnome ${NC}"
	sudo apt-get install -y vim-gnome
	check_error $? $_
fi


# --- Deploy config ---
if [ $d -eq 1 ];
then
    echo -e "${BLUE}----------- DEPLOY CONFIG ----------------${NC}"

	echo -e "${BLUE} - Install dark gitk from https://draculatheme.com/gitk/ ${NC}"
	git clone https://github.com/dracula/gitk.git ~/gitk
    mkdir -p ~/.config/git
	cp gitk/gitk ~/.config/git/

	echo -e "${BLUE} - Overwrite .bash_aliases ${NC}"
	cd ${CURRENT_DIR}
	cp ../configs/home/.bash_aliases ~/.bash_aliases

	echo -e "${BLUE} - Overwrite .bashrc ${NC}"
	cp ../configs/home/.bashrc ~/.bashrc

	echo -e "${BLUE} - Overwrite .gitconfig ${NC}"
	cp ../configs/home/.gitconfig ~/.gitconfig

	echo -e "${BLUE} - Overwrite .git-prompt ${NC}"
	cp ../configs/home/.git-prompt.sh ~/.git-prompt.sh

	echo -e "${BLUE} - Overwrite .minirc.dfl (for minicom) ${NC}"
	cp ../configs/home/.minirc.dfl ~/.minirc.dfl

	echo -e "${BLUE} - Overwrite .zshrc ${NC}"
	cp ../configs/home/.zshrc ~/.zshrc

	echo -e "${BLUE} - Apply personal zsh theme ${NC}"
	cp ../configs/home/.oh-my-zsh/custom/themes/guigui.zsh-theme ~/.oh-my-zsh/custom/themes/

	echo -e "${BLUE} - Apply personal terminator theme ${NC}"
	mkdir -p ~/.config/terminator
	cp ../configs/home/.config/terminator/config ~/.config/terminator/

	echo -e "${BLUE} - Vim init with Vundle ${NC}"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	echo -e "${BLUE} - Overwrite vimrc ${NC}"
	cp ../configs/home/.vimrc ~/

	echo -e "${BLUE} - Force theme update for gruvbox ${NC}"
	git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
	cp ~/.vim/bundle/gruvbox/colors/gruvbox.vim /usr/share/vim/vim74/colors/

	echo -e "${BLUE} - Install autosuggestion plugin for zsh ${NC}"
	cd ~/.oh-my-zsh/plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions.git
fi
