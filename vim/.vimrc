runtime! autoload/pathogen.vim
if exists("*pathogen#infect")
    execute pathogen#infect()
    execute pathogen#helptags()
endif

syntax on
filetype plugin indent on

set encoding=utf-8
set fileformat=unix
set number
set backspace=indent,eol,start
set autoindent
set ruler
set showcmd
set nowrap
set nowrapscan
set background=dark
set t_Co=4096
set cursorline
set incsearch
set scrolloff=3

" Highlight the search term and remove the highlight when you press enter
set hlsearch
nnoremap <CR> :nohlsearch<cr>

" Tabs are 4 spaces (except for makefiles, because expanding tabs causes a
" syntax error in make)
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab
else
    set expandtab
    set tabstop=4
    set shiftwidth=4
endif

" Save and run the current buffer
nmap <F5> :w<CR>:!chmod +x %<CR>:!%:p<CR>
imap <F5> <ESC><F5>

" Toggle NERDTree using CTRL+t
map <C-t> :NERDTreeToggle<CR>

" Auto-close vim if the only window left is a NERDTree window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Easier resizing for splits using ALT+arrows
nmap <A-right> <C-w>>
nmap <A-left> <C-w><
nmap <A-up> <C-w>+
nmap <A-down> <C-w>-

" Quickly fix the formatting of python files
command Autopep8 !autopep8 -i %
command Dos2unix !dos2unix %

" With the strip whitespace plugin, always prompt to delete trailing
" whitespace
let g:strip_whitespace_on_save = 1

command Shebang :normal i#!/bin/bash<CR><CR><ESC>
command Pybang :normal i#!/usr/bin/env python<CR><CR><ESC>

