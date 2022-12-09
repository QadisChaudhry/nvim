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

let g:netrw_banner = 0

au FileType tex setlocal spell wrap linebreak nolist
au FileType markdown setlocal spell wrap linebreak nolist
au FileType markdown nnoremap <silent> <buffer> <cr> :call markdown#SwitchStatus()<cr>
au FileType markdown inoremap <silent> <buffer> ,, -- <c-r>=strftime("%m/%d 11:59 pm")<cr>
" au FileType org inoremap <silent> <buffer> <c-cr> <c-o>:lua require("orgmode").action("org_mappings.handle_return")<cr>
" au FileType org setlocal conceallevel=2
au BufEnter *.keymap set ft=c
" au FileType tex setlocal spell textwidth=80 fo+=t

set termguicolors
set background=dark
" colorscheme nord
" colorscheme gruvbox
" colorscheme onedark
colorscheme everforest
" colorscheme kanagawa
" hi Normal ctermbg=NONE guibg=NONE

lua << EOF

if vim.g.colors_name == "everforest" then
    vim.cmd[[hi FloatBorder guibg=#2F383E]]
    vim.cmd[[hi NormalFloat guibg=#2F383E]]
elseif vim.g.colors_name == "kanagawa" then
    vim.cmd[[hi FloatBorder guibg=#1F1F28]]
    vim.cmd[[hi NormalFloat guibg=#1F1F28]]
end

EOF

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

au BufWritePre * call TrimWhitespace()
