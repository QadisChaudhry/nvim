local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.g.mapleader = " "

-- Comment Lines
map({ "n", "v" }, "<leader>/", ":Commentary<cr>", opts)

-- Latex
map("n", "<leader>lc", ":VimtexCompile<cr>", opts)
map("n", "<leader>le", ":VimtexErrors<cr>", opts)
map("n", "<leader>lv", ":VimtexView<cr>", opts)
map("n", "<leader>lk", ":VimtexClean<cr>", opts)
-- map("n", "<leader>lsd", "<plug>(vimtex-env-delete)", opts)
-- map("n", "<leader>lst", "<plug>(vimtex-delim-toggle-modifier)", opts)
-- map("n", "<leader>lsf", "<plug>(vimtex-cmd-toggle-frac)", opts)
-- map("n", "<leader>lsc", "<plug>(vimtex-delim-change-math)", opts)
map("n", "<leader>ltm", "imaster", opts)
map("n", "<leader>lt1", "itemplate1", opts)
map("n", "<leader>lt2", "itemplate2", opts)
map("n", "<leader>lt3", "itemplate3", opts)

-- Terminal
map("n", "<leader>it", ":lua _OPEN_TERM()<cr>", opts)
map("n", "<leader>ig", ":lua _LAZYGIT_TOGGLE()<cr>", opts)
map("n", "<leader>ip", ":lua _PYTHON_TOGGLE()<cr>", opts)
map("n", "<leader>ir", ":lua _RANGER_TOGGLE()<cr>", opts)
map("n", "<leader>iw", ":lua _THOKR_TOGGLE()<cr>", opts)

-- map("n", "<leader>it", ":ToggleTerm<cr>", opts)
-- map("n", "<leader>ig", ":lua _LAZYGIT_TOGGLE()<cr>", opts)
-- map("n", "<leader>ip", ":lua _PYTHON_TOGGLE()<cr>", opts)
-- map("n", "<leader>ir", ":lua _RANGER_TOGGLE()<cr>", opts)
-- map("n", "<leader>iw", ":lua _THOKR_TOGGLE()<cr>", opts)
-- map("t", "<C-k>", "<C-\\><C-n>:ToggleTerm<cr>", opts)

-- map("n", "<leader>it", ":FloatermToggle<cr>", opts)
-- map("n", "<leader>ig", ":FloatermNew lazygit<cr>", opts)
-- map("n", "<leader>ip", ":FloatermNew ipython<cr>", opts)
-- map("n", "<leader>ir", ":FloatermNew ranger<cr>", opts)
-- map("n", "<leader>iw", ":FloatermNew thokr<cr>", opts)
-- map("n", "<leader>ik", ":FloatermKill<cr>", opts)
-- map("t", "<C-k>", "<C-\\><C-n>:FloatermToggle<cr>", opts)

-- Search
-- map("n", "<leader>sr", ":Telescope oldfiles path_display={'truncate'}<cr>", opts)
-- map("n", "<leader>sr", ":Telescope oldfiles<cr>", opts)
map("n", "<leader>sr", ":Telescope frecency<cr>", opts)
map("n", "<leader>sw", ":Telescope live_grep<cr>", opts)
map("n", "<leader>sh", ":Telescope help_tags<cr>", opts)
map("n", "<leader>sb", ":Telescope buffers<cr>", opts)
map("n", "<leader>sv", ":Telescope lsp_document_symbols<cr>", opts)
map("n", "<leader>sf", ":Telescope file_browser<cr>", opts)
map("n", "<leader>su", ":Telescope undo<cr>", opts)
map("n", "<leader>ss", ":lua require('plugins.config.telescope').school()<cr>", opts)
map("n", "<leader>sc", ":lua require('plugins.config.telescope').vrc()<cr>", opts)
map("n", "<leader>sp", ":lua require('plugins.config.telescope').proj()<cr>", opts)

-- Buffers
map("n", "<RIGHT>", ":bnext<cr>", opts)
map("n", "<LEFT>", ":bprevious<cr>", opts)
-- map("n", "<leader>bl", ":bnext<cr>", opts)
-- map("n", "<leader>bh", ":bprevious<cr>", opts)
map("n", "<leader>bq", ":bdelete!<cr>", opts)

-- Clipboard
-- map("n", "<leader>c", ":lua require('telescope').extensions.neoclip.default({ on_complete = { function() vim.cmd('stopinsert') end } })<cr><cr>", opts)
map("n", "<leader>c", ":Telescope neoclip<cr>", opts)
map("n", "<leader>y", ":%w !pbcopy<cr><cr>", opts)
map("v", "<leader>y", '"*y', opts)

-- Spelling Correction
map("i", "<c-l>", "<c-g>u<esc>[s1z=`]a<c-g>u", opts)

-- ChatGPT
map("n", "<leader>a", ":ChatGPT<cr>", { noremap = true })
-- map("v", "<leader>a", ":AI<cr>", opts)
-- map("i", "<c-a>", "<esc>:AI<cr>a", opts)

-- Undo Breakpoints
map("i", ",", ",<c-g>u", opts)
map("i", ".", ".<c-g>u", opts)
map("i", ";", ";<c-g>u", opts)

-- Miscellaneous
map("n", "<leader>,", ":Alpha<cr>", opts)
map("n", "<leader>w", ":w<cr>", opts)
map("n", "<leader>r", ":source $MYVIMRC<cr>", opts)
map("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
map('v', '<Leader>p', ":lua require('silicon').visualise_cmdline({to_clip = false, show_buf = false})<cr>", opts)

map("n", "Q", "@a", opts)
-- map("n", "n", "nzz", opts)
-- map("n", "N", "Nzz", opts)
map("n", "<c-u>", "<c-u>zz", opts)
map("n", "<c-d>", "<c-d>zz", opts)
map("n", "Y", "y$", opts)
map("n", "E", "ge", opts)
map("n", ">", "<s-v>><esc>", opts)
map("n", "<", "<s-v><<esc>", opts)

map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map({ "n", "v" }, "<DOWN>", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "v" }, "<UP>", "v:count == 0 ? 'gk' : 'k'", { expr = true })

map({ "i", "c" }, "<M-C-H>", "<c-w>", { noremap = true })
map({ "i", "c" }, "<M-b>", "<s-left>", { noremap = true })
map({ "i", "c" }, "<M-f>", "<s-right>", { noremap = true })

map("x", "<s-UP>", ":move '<-2<cr>gv-gv", opts)
map("x", "<s-DOWN>", ":move '>+1<cr>gv-gv", opts)

map({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", opts)

-- map("n", "<c-h>", ":execute 'help ' . expand('<cword>')<cr>", opts)
