syntax on

set showcmd
set path+=**
set belloff=all
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set rnu
set nu
set hidden
set nohlsearch
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set encoding=utf-8
set signcolumn=yes
set cursorline
set scroll=5
set scrolloff=8
set updatetime=50
set cmdheight=1
set ignorecase
set smartcase
set noruler

au FileType tex setlocal spell wrap linebreak nolist
au FileType markdown setlocal spell wrap linebreak nolist
au BufEnter *.keymap set ft=c
" au FileType tex setlocal spell textwidth=80 fo+=t

set termguicolors
set background=dark
" colorscheme nord
" colorscheme gruvbox
" colorscheme onedark
colorscheme everforest
" hi Normal ctermbg=NONE guibg=NONE

let g:netrw_banner = 0

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

au BufWritePre * call TrimWhitespace()
