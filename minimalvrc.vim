source $HOME/.config/nvim/general/plugins.vim
source $HOME/.config/nvim/general/settings.vim

source $HOME/.config/nvim/plug-config/vimtex.vim

set laststatus=0 noshowcmd

lua << EOF
require("user.keys.mappings")
vim.keymap.set({ "i", "c" }, "<M-BS>", "<c-w>", { noremap = true })
vim.keymap.set("n", "<esc>", ":wq<cr>", opts)
vim.wo.fillchars='eob: '

require("user.treesitter")
require("user.cmp")
require("user.lsp")
require("user.autopairs")
EOF
