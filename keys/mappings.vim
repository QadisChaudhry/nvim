let mapleader = " "
noremap <leader>e :Lex <bar> :vertical resize 30<cr>
noremap <leader>t :tabedit <bar> :Startify<cr>

nnoremap <leader>c :Commentary<cr>
vnoremap <leader>c :Commentary<cr>

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <C-c> <Esc>

nnoremap <C-h> :execute "help " . expand("<cword>")<cr>

tnoremap <C-t> <C-\><C-n>:FloatermToggle<cr>

nmap - <Plug>NetrwBrowseUpDir

xnoremap K :move '<-2<cr>gv-gv
xnoremap J :move '>+1<cr>gv-gv

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
nnoremap <Up> gk
nnoremap <Down> gj

vnoremap <Left> h
vnoremap <Right> l
nnoremap <Left> h
nnoremap <Right> l
