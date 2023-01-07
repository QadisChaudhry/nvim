local status_ok, _ = pcall(require, "leap")
if not status_ok then
    return
end

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map({ "n", "v", "x" }, "f", "<Plug>(leap-forward-to)", opts)
map({ "n", "v", "x" }, "F", "<Plug>(leap-backward-to)", opts)
map({ "n", "v", "x" }, "gs", "<Plug>(leap-cross-window)", opts)
