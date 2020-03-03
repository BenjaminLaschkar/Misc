" VUNDLE config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'itchyny/lightline.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Personal config
set number
set nowrap
let mapleader=","

" Personal theme
set laststatus=2
colorscheme gruvbox
if !has('gui_running')
	set t_Co=256
endif
set bg=dark
set shiftwidth=4
set cursorline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Nerdtree config
let NERDTreeMapOpenInTab='\t'
nnoremap <F4> :browse oldfiles<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle %<CR>
let NERDTreeShowHidden=1

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fast move
nnoremap <S-H> <S-LEFT>
nnoremap <S-L> <S-RIGHT>
nnoremap <S-J> <S-DOWN>
nnoremap <S-K> <S-UP>

" JJ -> ESC (normal mode)
inoremap jj <ESC>

" Copy paste izy
vnoremap <Leader>y "*y
vnoremap <Leader>p "*p
vnoremap <Leader>Y "+y
vnoremap <Leader>P "+p

" switch of buffer (TAB / SHIFT-TAB)
nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nnoremap <C-W> :bd<CR>
