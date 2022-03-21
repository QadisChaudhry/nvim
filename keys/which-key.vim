nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
set timeoutlen=250

let g:which_key_map = {}
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

let g:which_key_map[','] = [':Startify', 'start screen']
let g:which_key_map['w'] = [':w', 'write file']
let g:which_key_map['r'] = [':source $MYVIMRC', 'reload config']

let g:which_key_map['e'] = [':NvimTreeToggle', 'file explorer']

let g:which_key_map['v'] = [':Telescope lsp_document_symbols', 'variables']

let g:which_key_map.m = {
\ 'name': '+markdown',
\ 'p': ['<Plug>MarkdownPreviewToggle', 'preview'],
\ 's': [':call markdown#SwitchStatus()<cr>', 'select item']
\ }

let g:which_key_map.l = {
\ 'name': '+latex',
\ 'e': [':VimtexErrors', 'errors'],
\ 'c': [':VimtexCompile', 'compile'],
\ 'v': [':VimtexView', 'view'],
\ 'k': [':VimtexClean', 'kill aux'],
\ 't': {
\ 'name' : '+templates',
\ '1' : ['itemplate1', 'With Title'],
\ '2' : ['itemplate2', 'With Title Page'],
\ '3' : ['itemplate3', 'Basic Template']
\ }
\ }

let g:which_key_map.i = {
\ 'name': '+terminal',
\ 't': [':ToggleTerm', 'terminal'],
\ 'g': 'git',
\ 'p': 'python'
\ }

let g:which_key_map.f = {
\ 'name' : '+files',
\ 'o' : [':Telescope oldfiles', 'recent files'],
\ 'g' : [':Telescope live_grep', 'grep'],
\ 's' : 'school files',
\ 'v' : 'vim config',
\ 'p' : 'projects'
\ }

let g:which_key_map.b = {
\ 'name' : '+buffers',
\ 'n' : [':bnext', 'next buffer'],
\ 'p' : [':bprevious', 'previous buffer'],
\ 'q' : [':bdelete!', 'close buffer'],
\ 's' : [':Telescope buffers', 'search buffers'],
\ }

let g:which_key_map['/'] = 'comment line'
let g:which_key_map.y = 'copy file contents'
let g:which_key_map.c = 'clipboard'

call which_key#register('<Space>', "g:which_key_map")
