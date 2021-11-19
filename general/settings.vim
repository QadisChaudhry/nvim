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
set colorcolumn=120
set cursorline
set scroll=10
set scrolloff=8
set updatetime=50
set cmdheight=1

au FileType tex setlocal spell wrap linebreak nolist colorcolumn=0
au FileType md setlocal spell wrap linebreak nolist colorcolumn=0
" au FileType tex setlocal spell textwidth=80 fo+=t

colorscheme gruvbox
set background=dark

let g:netrw_banner = 0
