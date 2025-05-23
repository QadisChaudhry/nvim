local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

vim.opt.timeoutlen = 300

local setup = {
    plugins = {
        marks = false,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
            g = false,
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
    ["q"] = { "Quit Buffer" },
    ["r"] = { "Reload Config" },
    -- ["e"] = { "Explorer" },
    ["c"] = { "Clipboard" },
    ["y"] = { "Copy to System" },
    ["p"] = { "Print Code" },
    ["<space>"] = { "Switch Buffers" },

    l = {
        name = "Latex",
        c = { "Compile" },
        e = { "Errors" },
        v = { "View" },
        k = { "Kill Aux" },
        -- s = {
        --     name = "Surround",
        --     d = { "Delete Env" },
        --     t = { "Toggle Delim" },
        --     c = { "Change Delim" },
        --     f = { "Change Frac" },
        -- },
        t = {
            name = "Templates",
            m = { "Master Template" },
            ["1"] = { "With Title" },
            ["2"] = { "With Title Page" },
            ["3"] = { "Basic Template" },
        },
    },

    m = {
        name = "Markdown",
        p = { "Preview" },
    },

    o = {
        name = "Open",
        n = { "Note" },
        t = { "TODO" },
    },

    i = {
        name = "Terminal",
        i = { "Buffer Terminal" },
        t = { "Floating Terminal" },
        g = { "Git" },
        p = { "Python" },
        r = { "Ranger" },
        w = { "Typing Test" },
        o = { "Open in Finder" },
    },

    s = {
        name = "Search",
        a = { "Home Directory" },
        r = { "Recent Files" },
        w = { "Find Word" },
        h = { "Help Tags" },
        -- s = { "Switch Buffers" },
        v = { "Variables" },
        -- s = { "School" },
        c = { "Vim Config" },
        -- p = { "Projects" },
        f = { "File Explorer" },
        u = { "Undo Tree" },
        z = { "Zettelkasten" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
