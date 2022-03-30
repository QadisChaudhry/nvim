" General
source $HOME/.config/nvim/general/plugins.vim
source $HOME/.config/nvim/general/settings.vim

" Keymaps
" source $HOME/.config/nvim/keys/mappings.vim
" source $HOME/.config/nvim/keys/which-key.vim

" Plugins
source $HOME/.config/nvim/plug-config/markdown-preview.vim
source $HOME/.config/nvim/plug-config/markdown.vim
" source $HOME/.config/nvim/plug-config/airline.vim
" source $HOME/.config/nvim/plug-config/ale.vim
" source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/floaterm.vim

lua << EOF
require("user.keys.mappings")
require("user.keys.which-key")

require("user.treesitter")
require("user.telescope")
require("user.cmp")
require("user.lsp")
require("user.autopairs")
require("user.nvimtree")
-- require("user.toggleterm")
require("user.neoclip")
require("user.bufferline")
require("user.lualine.lualine")
EOF
