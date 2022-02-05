call plug#begin('~/.config/nvim/plugged')

Plug 'ellisonleao/gruvbox.nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-python/python-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'voldikss/vim-floaterm'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
