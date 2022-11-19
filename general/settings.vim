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
set autochdir
set mouse=
set conceallevel=2

au FileType tex setlocal spell wrap linebreak nolist
au FileType markdown setlocal spell wrap linebreak nolist
au FileType markdown nnoremap <silent> <buffer> <cr> :call markdown#SwitchStatus()<cr>
au BufEnter *.keymap set ft=c
" au BufEnter * silent! lcd %:p:h
" au FileType tex setlocal spell textwidth=80 fo+=t

set termguicolors
set background=dark
" colorscheme nord
" colorscheme gruvbox
" colorscheme onedark
colorscheme everforest
" hi Normal ctermbg=NONE guibg=NONE

hi FloatBorder guibg=#2F383E
hi NormalFloat guibg=#2F383E

let g:netrw_banner = 0

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

au BufWritePre * call TrimWhitespace()
