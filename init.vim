" General
source $HOME/.config/nvim/general/plugins.vim
source $HOME/.config/nvim/general/settings.vim

" Plugins
" source $HOME/.config/nvim/plug-config/markdown-preview.vim
source $HOME/.config/nvim/plug-config/markdown.vim
" source $HOME/.config/nvim/plug-config/airline.vim
" source $HOME/.config/nvim/plug-config/ale.vim
" source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/startify.vim
" source $HOME/.config/nvim/plug-config/floaterm.vim

lua << EOF
-- Keymaps
require("user.keys.mappings")
require("user.keys.which-key")

-- LSP
require("user.cmp")
require("user.lsp")

-- Plugins
require("user.treesitter")

require("user.telescope")
require("user.neoclip")

require("user.nvimtree")

-- require("user.toggleterm")
require("user.oterm")

-- require("user.bufferline")
-- require("user.lualine.lualine")
require("user.heirline")

require("user.autopairs")
require("user.leap")
require("user.silicon")
require("user.ai")
EOF
