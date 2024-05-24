local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.g.mapleader = " "

-- Comment Lines
map({ "n", "v" }, "<leader>/", ":Commentary<cr>", opts)

-- Spelling Correction
map("i", "<c-l>", "<c-g>u<esc>[s1z=`]a<c-g>u", opts)

-- Latex
map("n", "<leader>lc", ":VimtexCompile<cr>", opts)
map("n", "<leader>le", ":VimtexErrors<cr>", opts)
map("n", "<leader>lv", ":VimtexView<cr>", opts)
map("n", "<leader>lk", ":VimtexClean<cr>", opts)
map("n", "<leader>ltm", "imaster", opts)
map("n", "<leader>lt1", "itemplate1", opts)
map("n", "<leader>lt2", "itemplate2", opts)
map("n", "<leader>lt3", "itemplate3", opts)

-- Markdown
map("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", opts)

-- Notes
map("n", "<leader>on", ":lua SPAWN_NOTE_WINDOW('~/zettelkasten/dump.md')<cr>", opts)
map("n", "<leader>ot", ":lua SPAWN_NOTE_WINDOW('~/Documents/College/TODO.md')<cr>", opts)

-- Terminal
map("n", "<leader>it", ":lua _OPEN_TERM()<cr>", opts)
map("n", "<leader>ig", ":lua _LAZYGIT_TOGGLE()<cr>", opts)
map("n", "<leader>ip", ":lua _PYTHON_TOGGLE()<cr>", opts)
map("n", "<leader>ir", ":lua _RANGER_TOGGLE()<cr>", opts)
map("n", "<leader>iw", ":lua _THOKR_TOGGLE()<cr>", opts)

-- Search
map("n", "<leader>sr", ":Telescope oldfiles<cr>", opts)
map("n", "<leader>sw", ":Telescope live_grep<cr>", opts)
map("n", "<leader>sh", ":Telescope help_tags<cr>", opts)
map("n", "<leader>sv", ":Telescope lsp_document_symbols<cr>", opts)
map("n", "<leader>sf", ":Telescope file_browser<cr>", opts)
map("n", "<leader>sa", ":Telescope file_browser path=~<cr>", opts)
map("n", "<leader>su", ":Telescope undo<cr>", opts)
map("n", "<leader>sc", ":lua require('plugins.config.telescope').vrc()<cr>", opts)
map("n", "<leader>sz", ":lua require('plugins.config.telescope').ztlk()<cr>", opts)
map("n", "<leader><space>", ":Telescope buffers<cr>", opts)

-- Buffers
map("n", "<RIGHT>", ":bnext<cr>", opts)
map("n", "<LEFT>", ":bprevious<cr>", opts)
map("n", "<leader>q", ":bdelete!<cr>", opts)

-- Clipboard
-- map("n", "<leader>c", ":Telescope neoclip initial_mode=normal<cr>", opts)
map("n", "<leader>c", ":Telescope neoclip<cr>", opts)
map("n", "<leader>y", ":%w !pbcopy<cr><cr>", opts)
map("v", "<leader>y", '"*y', opts)

-- Undo Breakpoints
map("i", ",", ",<c-g>u", opts)
map("i", ".", ".<c-g>u", opts)
map("i", ";", ";<c-g>u", opts)

-- Better <C-u> and <C-d> Scrolling
map("n", "<c-u>", "(line('.') > (line('$') - 30)) ? '<c-u>' : '<c-u>zz'", { expr = true, noremap = true })
map("n", "<c-d>", "(line('.') > 30) ? '<c-d>' : '<c-d>zz'", { expr = true, noremap = true })
-- map("n", "<c-u>", "<c-u>zz", opts)
-- map("n", "<c-d>", "<c-d>zz", opts)

-- Move Lines
map("x", "<s-UP>", ":move '<-2<cr>gv-gv", opts)
map("x", "<s-DOWN>", ":move '>+1<cr>gv-gv", opts)

-- Miscellaneous
map("n", "<leader>,", ":Alpha<cr>", opts)
map("n", "<leader>w", ":w<cr>", opts)
map("n", "<leader>r", ":so %<cr>", opts)
map("n", "-", ":lua MiniFiles.open()<cr>", opts)
map("v", "<leader>p", ":Silicon<cr>", opts)

map("n", "Q", "@a", opts)
map("n", "Y", "y$", opts)
map("n", "E", "ge", opts)
map("n", ">", "<s-v>><esc>", opts)
map("n", "<", "<s-v><<esc>", opts)

map({ "i", "c" }, "<M-C-H>", "<c-w>", { noremap = true })
map({ "i", "c" }, "<M-BS>", "<c-w>", { noremap = true })
map({ "i", "c" }, "<M-b>", "<s-left>", { noremap = true })
map({ "i", "c" }, "<M-f>", "<s-right>", { noremap = true })

-- VOID
-- map("n", "<c-h>", ":execute 'help ' . expand('<cword>')<cr>", opts)
-- map("n", "n", "nzz", opts)
-- map("n", "N", "Nzz", opts)
-- map("n", "<leader>lsd", "<plug>(vimtex-env-delete)", opts)
-- map("n", "<leader>lst", "<plug>(vimtex-delim-toggle-modifier)", opts)
-- map("n", "<leader>lsf", "<plug>(vimtex-cmd-toggle-frac)", opts)
-- map("n", "<leader>lsc", "<plug>(vimtex-delim-change-math)", opts)
-- map("n", "<leader>sr", ":Telescope oldfiles path_display={'truncate'}<cr>", opts) map("n", "<leader>sr", ":Telescope oldfiles<cr>", opts)
-- map("n", "<leader>ss", ":lua require('plugins.config.telescope').school()<cr>", opts)
-- map("n", "<leader>sp", ":lua require('plugins.config.telescope').proj()<cr>", opts)
-- map("n", "<leader>c", ":lua require('telescope').extensions.neoclip.default({ on_complete = { function() vim.cmd('stopinsert') end } })<cr><cr>", opts)
