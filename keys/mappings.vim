let mapleader = " "
noremap <leader>t :tabedit <bar> :Startify<cr>

nnoremap <leader>c :Commentary<cr>
vnoremap <leader>c :Commentary<cr>

nnoremap <leader>y :%w !pbcopy<cr><cr>
vnoremap <leader>y "*y<cr><cr>

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <C-c> <Esc>

nnoremap <C-h> :execute 'help ' . expand("<cword>")<cr>

tnoremap <Esc> <C-\><C-n>:ToggleTerm<cr>

xnoremap K :move '<-2<cr>gv-gv
xnoremap J :move '>+1<cr>gv-gv

nnoremap Q @@

nnoremap n nzz
nnoremap N Nzz

nnoremap Y y$

nnoremap p "0p
nnoremap P "0P
nnoremap dp ""p
nnoremap dP ""P
vnoremap p "0p
vnoremap P "0P
vnoremap dp ""p
vnoremap dP ""P

nnoremap > <S-v>><esc>
nnoremap < <S-v><<esc>

nnoremap <C-s> :%sm /

vnoremap <Up> gk
vnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Down> gj

vnoremap <Left> h
vnoremap <Right> l
nnoremap <Left> h
nnoremap <Right> l

nnoremap <leader>fs :lua require("user.telescope").school()<cr>
nnoremap <leader>fv :lua require("user.telescope").vrc()<cr>
nnoremap <leader>fp :lua require("user.telescope").proj()<cr>
