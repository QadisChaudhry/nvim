local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

vim.opt.timeoutlen = 250

local setup = {
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = false,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    key_labels = {},
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
    },
    popup_mappings = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
    },
    window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
    },
    ignore_missing = true,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = "auto",
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local mappings = {
    ["/"] = { "Comment" },
    [","] = { "Start Screen" },
    ["w"] = { "Write File" },
    ["r"] = { "Reload Config" },
    ["e"] = { "Explorer" },
    ["v"] = { "Variables" },
    ["c"] = { "Clipboard" },

    m = {
        name = "Markdown",
        s = { "Select" },
        p = { "Preview" },
    },

    l = {
        name = "Latex",
        c = { "Code Action" },
        e = { "Format" },
        v = { "Info" },
        k = { "Installer Info" },
        t = {
            name = "Templates",
            ["1"] = { "With Title" },
            ["2"] = { "With Title Page" },
            ["3"] = { "Basic Template" },
        },
    },

    i = {
        name = "Terminal",
        t = { "Terminal" },
        g = { "Git" },
        p = { "Python" },
    },

    f = {
        name = "Files",
        o = { "Recent Files" },
        w = { "Find Word" },
        h = { "Help Pages" },
        s = { "School" },
        v = { "Vim Config" },
        p = { "Projects" },
    },

    b = {
        name = "Buffers",
        n = { "Next Buffer" },
        p = { "Previous Buffer" },
        q = { "Close Buffer" },
        s = { "Search Buffers" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
