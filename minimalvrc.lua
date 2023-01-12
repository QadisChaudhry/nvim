require("plugins")
require("settings")

require("plugins.config.vimtex")

vim.o.laststatus = 0
vim.o.noshowcmd = true

require("keys.mappings")
vim.keymap.set({ "i", "c" }, "<M-BS>", "<c-w>")
vim.keymap.set("n", "<esc>", ":wq<cr>", { silent = true })
vim.wo.fillchars = "eob: "

require("lsp")
require("plugins.config.cmp")

require("plugins.config.treesitter")
require("plugins.config.autopairs")
require("plugins.config.leap")
require("plugins.config.silicon")
