local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "sainnhe/everforest",
        tag = "v0.2.3",
        config = function()
            vim.cmd[[colorscheme everforest]]
        end
    },

    { "nvim-treesitter/nvim-treesitter" },
    { "kyazdani42/nvim-web-devicons" },

    { "SirVer/ultisnips" },

    {
        "lervag/vimtex",
        ft = "tex"
    },

    {
        "gabrielelana/vim-markdown",
        ft = "markdown",
        config = function()
            vim.g.markdown_enable_mappings = 0
        end
    },

    { "goolord/alpha-nvim" },
    { "tpope/vim-commentary" },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "AckslD/nvim-neoclip.lua",
            "debugloop/telescope-undo.nvim"
        }
    },

    {
        "rebelot/heirline.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim"
        }
    },

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "mfussenegger/nvim-jdtls" },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "quangnguyen30192/cmp-nvim-ultisnips",
        }
    },

    { "doums/oterm.nvim" },

    { "windwp/nvim-autopairs" },
    { "kyazdani42/nvim-tree.lua" },
    { "folke/which-key.nvim" },
    { "ggandor/leap.nvim" },
    { "narutoxy/silicon.lua" },

    { "aduros/ai.vim" },
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim"
        }
    }
}

local opts = {
    lockfile = vim.fn.stdpath("config") .. "/lua/plugins/lazy-lock.json",
    ui = {
        border = "rounded"
    }
}

require("lazy").setup(plugins, opts)
