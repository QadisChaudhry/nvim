local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Comment Lines
map("n", "<leader>/", ":Commentary<cr>", opts)
map("v", "<leader>/", ":Commentary<cr>", opts)

-- Markdown
map("n", "<leader>mp", ":<Plug>MarkdownPreviewToggle<cr>", opts)
map("n", "<leader>ms", ":call markdown#SwitchStatus()<cr><cr>", opts)

-- Latex
map("n", "<leader>lc", ":VimtexCompile<cr>", opts)
map("n", "<leader>le", ":VimtexErrors<cr>", opts)
map("n", "<leader>lv", ":VimtexView<cr>", opts)
map("n", "<leader>lk", ":VimtexClean<cr>", opts)
map("n", "<leader>lt1", "itemplate1", opts)
map("n", "<leader>lt2", "itemplate2", opts)
map("n", "<leader>lt3", "itemplate3", opts)

-- Terminal
map("n", "<leader>it", ":ToggleTerm<cr>", opts)
map("n", "<leader>ig", ":lua _LAZYGIT_TOGGLE()<cr>", opts)
map("n", "<leader>ip", ":lua _PYTHON_TOGGLE()<cr>", opts)
map("t", "<esc>", "<C-\\><C-n>:ToggleTerm<cr>", opts)

-- Search
map("n", "<leader>sr", ":Telescope oldfiles<cr>", opts)
map("n", "<leader>sw", ":Telescope live_grep<cr>", opts)
map("n", "<leader>sh", ":Telescope help_tags<cr>", opts)
map("n", "<leader>sb", ":Telescope buffers<cr>", opts)
map("n", "<leader>sv", ":Telescope lsp_document_symbols<cr>", opts)
map("n", "<leader>ss", ":lua require('user.telescope').school()<cr>", opts)
map("n", "<leader>sc", ":lua require('user.telescope').vrc()<cr>", opts)
map("n", "<leader>sp", ":lua require('user.telescope').proj()<cr>", opts)

-- Buffers
map("n", "<leader>bn", ":bnext<cr>", opts)
map("n", "<leader>bp", ":bprevious<cr>", opts)
map("n", "<leader>bq", ":bdelete!<cr>", opts)

-- Clipboard
-- map("n", "<leader>c", ":lua require('telescope').extensions.neoclip.default({ on_complete = { function() vim.cmd('stopinsert') end } })<cr><cr>", opts)
map("n", "<leader>c", ":Telescope neoclip star<cr>", opts)

-- Spelling Correction
map("i", "<c-l>", "<c-g>u<esc>[s1z=`]a<c-g>u", opts)

-- Miscellaneous
map("n", "<leader>,", ":Startify<cr>", opts)
map("n", "<leader>w", ":w<cr>", opts)
map("n", "<leader>r", ":source $MYVIMRC<cr>", opts)
map("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

map("n", "Q", "@@", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "Y", "y$", opts)
map("n", ">", "<s-v>><esc>", opts)
map("n", "<", "<s-v>><esc>", opts)

map("n", "<UP>", "gk", opts)
map("v", "<UP>", "gk", opts)
map("n", "<DOWN>", "gj", opts)
map("v", "<DOWN>", "gj", opts)

-- map("n", "y", ":%w !pbcopy<cr><cr>", opts)
-- map("v", "y", ':"*y', opts)
-- map("x", "K", ':move '<-2<cr>gv-gv', opts)
-- map("x", "J", ':move '>+1<cr>gv-gv', opts)
-- map("n", "<c-h>", ":execute 'help ' . expand('<cword>')<cr>", opts)
