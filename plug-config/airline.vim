let g:airline_theme = 'base16_mocha'

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_exclude_filetypes = [ "NvimTree" ]

let g:airline#extensions#nvimlsp#enabled = 0
let g:airline_detect_spell = 0
let g:airline_section_y = ''
let g:airline_section_c = '%t %m'
