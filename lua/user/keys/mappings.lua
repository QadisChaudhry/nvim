local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Comment Lines
map("n", "<leader>/", "<cmd>Commentary<cr>", opts)
map("v", "<leader>/", "<cmd>Commentary<cr>", opts)

-- Markdown
map("n", "<leader>mp", "<cmd><Plug>MarkdownPreviewToggle<cr>", opts)
map("n", "<leader>ms", "<cmd>call markdown#SwitchStatus()<cr><cr>", opts)

-- Latex
map("n", "<leader>lc", "<cmd>VimtexCompile<cr>", opts)
map("n", "<leader>le", "<cmd>VimtexErrors<cr>", opts)
map("n", "<leader>lv", "<cmd>VimtexView<cr>", opts)
map("n", "<leader>lk", "<cmd>VimtexClean<cr>", opts)
map("n", "<leader>lt1", "itemplate1<cr>", opts)
map("n", "<leader>lt2", "itemplate2<cr>", opts)
map("n", "<leader>lt3", "itemplate3<cr>", opts)

-- Terminal
map("n", "<leader>it", "<cmd>ToggleTerm<cr>", opts)
map("n", "<leader>ig", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
map("n", "<leader>ip", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts)
map("t", "<esc>", "<C-\\><C-n>:ToggleTerm<cr>", opts)

-- Search
map("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", opts)
map("n", "<leader>sw", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "<leader>sb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>sv", "<cmd>Telescope lsp_document_symbols<cr>", opts)
map("n", "<leader>ss", "<cmd>lua require('user.telescope').school()<cr>", opts)
map("n", "<leader>sc", "<cmd>lua require('user.telescope').vrc()<cr>", opts)
map("n", "<leader>sp", "<cmd>lua require('user.telescope').proj()<cr>", opts)

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<cr>", opts)
map("n", "<leader>bp", "<cmd>bprevious<cr>", opts)
map("n", "<leader>bq", "<cmd>bdelete!<cr>", opts)

-- Clipboard
-- map("n", "<leader>c", "<cmd>lua require('telescope').extensions.neoclip.default({ on_complete = { function() vim.cmd('stopinsert') end } })<cr><cr>", opts)
map("n", "<leader>c", "<cmd>Telescope neoclip star<cr>", opts)

-- Spelling Correction
map("i", "<c-l>", "<c-g>u<esc>[s1z=`]a<c-g>u", opts)

-- Miscellaneous
map("n", "<leader>,", "<cmd>Startify<cr>", opts)
map("n", "<leader>w", "<cmd>w<cr>", opts)
map("n", "<leader>r", "<cmd>source $MYVIMRC<cr>", opts)
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

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

-- map("n", "y", "<cmd>%w !pbcopy<cr><cr>", opts)
-- map("v", "y", '<cmd>"*y', opts)
-- map("x", "K", '<cmd>move '<-2<cr>gv-gv', opts)
-- map("x", "J", '<cmd>move '>+1<cr>gv-gv', opts)
-- map("n", "<c-h>", "<cmd>execute 'help ' . expand('<cword>')<cr>", opts)
