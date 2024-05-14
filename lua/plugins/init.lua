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
        "ellisonleao/gruvbox.nvim",
        -- config = function()
        --     vim.cmd[[colorscheme gruvbox]]
        -- end
    },

    {
        "sainnhe/everforest",
        -- tag = "v0.2.3",
        -- config = function()
        --     vim.cmd[[colorscheme everforest]]
        -- end
    },

    {
        "rmehri01/onenord.nvim",
        -- config = true
    },

    {
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd[[colorscheme kanagawa]]
        end
    },

    -- {
    --     "HoNamDuong/hybrid.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         vim.cmd[[colorscheme hybrid]]
    --     end
    -- },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        -- event = "VimEnter"
        lazy = false
    },

    {
        "nvim-tree/nvim-web-devicons",
        commit = "b34362b20a4942b3245f958e73ebe1b09b020ad1"
    },

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

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = "markdown",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
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
            {"kkharji/sqlite.lua", module = "sqlite"},
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

    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v3.x",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --     }
    -- },

    { "folke/which-key.nvim" },

    { "ggandor/leap.nvim" },

    {
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
    },

    -- {
    --    "stevearc/oil.nvim",
    --     opts = {},
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    -- },

    {
        "echasnovski/mini.files",
        version = '*',
    },
}

local opts = {
    lockfile = vim.fn.stdpath("config") .. "/lua/plugins/lazy-lock.json",
    ui = {
        border = "rounded"
    }
}

require("lazy").setup(plugins, opts)
