local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>ig", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})

local python = Terminal:new({ cmd = "ipython", hidden = true })
function _PYTHON_TOGGLE()
    python:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>ip", "<cmd>lua _PYTHON_TOGGLE()<CR>", {noremap = true, silent = true})
