nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
set timeoutlen=250

let g:which_key_map =  {}
let g:which_key_sep = '→'

let g:which_key_use_floating_win = 0
let g:which_key_centered = 0
let g:which_key_sort_horizontal = 1

highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 signcolumn=no noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 signcolumn=yes showmode ruler

let g:which_key_map['h'] = [':wincmd h', 'win left']
let g:which_key_map['l'] = [':wincmd l', 'win right']
let g:which_key_map['j'] = [':wincmd j', 'win down']
let g:which_key_map['k'] = [':wincmd k', 'win up']

let g:which_key_map[','] = [':Startify', 'start screen']
let g:which_key_map['q'] = [':wqa', 'write and quit all']
let g:which_key_map['w'] = [':w', 'write file']
let g:which_key_map['r'] = [':source $MYVIMRC', 'reload config']

let g:which_key_map['s'] = [':call markdown#SwitchStatus()<cr>', 'select item']
let g:which_key_map.m = {
\ 'name': '+markdown',
\ 'p': ['<Plug>MarkdownPreviewToggle', 'Preview']
\ }

let g:which_key_map.v = {
\ 'name': '+vimtex',
\ 'e': [':VimtexErrors', 'errors'],
\ 'c': [':VimtexCompile', 'compile'],
\ 'v': [':VimtexView', 'view'],
\ 'k': [':VimtexClean', 'kill aux'],
\ }

let g:which_key_map.i = {
\ 'name': '+terminal',
\ 't': [':FloatermToggle', 'terminal'],
\ 'g': [':FloatermNew lazygit', 'git'],
\ 'f': [':FloatermNew fzf', 'fzf'],
\ 'p': [':FloatermNew ipython', 'python'],
\ }

let g:which_key_map.f = {
\ 'name' : '+fold',
\ 'f' : [ 'zf%', 'fold lines'],
\ 'd' : [ 'zd', 'unfold lines'],
\ }

let g:which_key_map.e = 'tree explorer'
let g:which_key_map.t = 'new tab'
let g:which_key_map.c = 'comment line'
let g:which_key_map.y = 'copy file contents'

call which_key#register('<Space>', "g:which_key_map")
