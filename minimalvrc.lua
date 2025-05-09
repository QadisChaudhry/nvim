require("plugins")
require("settings")
require("autocmds")

require("plugins.config.vimtex")

vim.o.laststatus = 0
vim.o.showcmd = false
vim.o.nu = false
vim.o.rnu = false

require("keys.mappings")
vim.keymap.set({ "i", "c" }, "<M-BS>", "<c-w>")
vim.keymap.set("n", "q", ":wq<cr>", { silent = true })
vim.wo.fillchars = "eob: "

require("lsp")
require("plugins.config.cmp")

require("plugins.config.treesitter")
require("plugins.config.autopairs")
require("plugins.config.leap")
require("plugins.config.silicon")
