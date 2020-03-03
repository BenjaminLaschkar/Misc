#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
OUT_DIR=${CURRENT_DIR}/../configs/home/

cp ~/.oh-my-zsh/custom/themes/guigui.zsh-theme ${OUT_DIR}/.oh-my-zsh/custom/themes/guigui.zsh-theme
cp ~/.bash_aliases ${OUT_DIR}/.bash_aliases
cp ~/.bashrc ${OUT_DIR}/.bashrc
cp ~/.git-prompt.sh ${OUT_DIR}/.git-prompt.sh
cp ~/.minirc.dfl ${OUT_DIR}/.minirc.dfl
cp ~/.zshrc ${OUT_DIR}/.zshrc
cp ~/.profile ${OUT_DIR}/.profile
cp ~/.vimrc ${OUT_DIR}/.vimrc
