syntax on

set showcmd
set belloff=all
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set rnu
set nu
set hidden
set nohlsearch
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set encoding=utf-8
set signcolumn=yes
set colorcolumn=120
set cursorline
set scroll=10
set scrolloff=8
set updatetime=50
set cmdheight=1
    au FileType tex setlocal spell wrap linebreak nolist colorcolumn=0
" au FileType tex setlocal spell textwidth=80 fo+=t

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'vim-python/python-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'Raimondi/delimitMate'
Plug 'unblevable/quick-scope'

call plug#end()

colorscheme gruvbox
set background=dark

let g:ranger_map_keys = 0

let g:netrw_banner = 0
let g:python_highlight_all = 1

let g:airline_theme = 'base16_mocha'

let airline#extensions#ale#show_line_numbers = 1
let g:ale_linters = {'python': ['flake8'], 'vim': ['vlint']}
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1
let g:ale_pattern_options = {'\.tex$': {'ale_enabled': 0}}

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let mapleader = " "
noremap <leader>e :Lex <bar> :vertical resize 30<cr>
noremap <leader>t :tabedit <bar> :Ranger<cr>

nnoremap <leader>c :Commentary<cr>
vnoremap <leader>c :Commentary<cr>

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <C-c> <Esc>

nmap - <Plug>NetrwBrowseUpDir

xnoremap K :move '<-2<cr>gv-gv
xnoremap J :move '>+1<cr>gv-gv

nnoremap <C-h> :execute "help " . expand("<cword>")<cr>

nnoremap Q <Nop>

nnoremap n nzz
nnoremap N Nzz

nnoremap Y y$

vnoremap > >gv
vnoremap < <gv
nnoremap > <S-v>><esc>
nnoremap < <S-v><<esc>

vnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Left> h
vnoremap <Right> l
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap <Left> h
nnoremap <Right> l

"coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"coc

let g:vimtex_view_method = "skim"
let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

function! UpdateSkim(status)
    if !a:status | return | endif
    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
endfunction

let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 0
let g:vimtex_compiler_progname = 'nvr'

let g:UltiSnipsExpandTrigger = '<c-space>'
let g:UltiSnipsJumpForwardTrigger = '<c-space>'

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']            },
          \ { 'type': 'files',     'header': ['   Files']               },
          \ { 'type': 'dir',       'header': ['   Current Directory']   },
          \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 0
let g:startify_files_number = 15
let g:startify_enable_special = 0


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

let g:which_key_map.v = {
\ 'name': '+vimtex',
\ 'e': [':VimtexErrors', 'errors'],
\ 'c': [':VimtexCompile', 'compile'],
\ 'v': [':VimtexView', 'view'],
\ 'k': [':VimtexClean', 'kill aux'],
\ }

let g:which_key_map.p = {
\ 'name': '+explorer',
\ 'v': [':Ranger', 'directory explorer'],
\ }

let g:which_key_map.f = {
\ 'name' : '+fold',
\ 'f' : [ 'zf%', 'fold lines'],
\ 'd' : [ 'zd', 'unfold lines'],
\ }

let g:which_key_map.s = {
\ 'name' : '+suround',
\ 's' : [ '<Plug>Ysurround', 'surround'],
\ 'c' : [ '<Plug>Csurround', 'change'],
\ 'd' : [ '<Plug>Dsurround', 'delete'],
\ }

let g:which_key_map.e = 'tree explorer'
let g:which_key_map.t = 'new tab'
let g:which_key_map.c = 'comment line'

call which_key#register('<Space>', "g:which_key_map")
