call plug#begin('~/.config/nvim/plugged')

Plug 'ellisonleao/gruvbox.nvim'
Plug 'shaunsingh/nord.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'w0rp/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'voldikss/vim-floaterm'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'windwp/nvim-autopairs'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'akinsho/toggleterm.nvim'

Plug 'alvarosevilla95/luatab.nvim'

call plug#end()
