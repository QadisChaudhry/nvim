call plug#begin('~/.config/nvim/plugged')

Plug 'ellisonleao/gruvbox.nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'sainnhe/everforest'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'w0rp/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'AckslD/nvim-neoclip.lua'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'windwp/nvim-autopairs'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'akinsho/toggleterm.nvim'
" Plug 'voldikss/vim-floaterm'

Plug 'akinsho/bufferline.nvim'

" Plug 'liuchengxu/vim-which-key'
Plug 'folke/which-key.nvim'

call plug#end()
