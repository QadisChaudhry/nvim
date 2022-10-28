local status_ok, _ = pcall(require, "leap")
if not status_ok then
    return
end

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map({ "n", "v" }, "f", "<Plug>(leap-forward-to)", opts)
map({ "n", "v" }, "F", "<Plug>(leap-backward-to)", opts)
map({ "n", "v" }, "gs", "<Plug>(leap-cross-window)", opts)
