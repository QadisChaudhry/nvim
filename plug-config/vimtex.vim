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

let g:vimtex_mappings_enabled = 1

let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 0
let g:vimtex_compiler_progname = 'nvr'
" set conceallevel=1

let g:vimtex_quickfix_ignore_filters = [
      \ '\headheight is too small (12.0pt)',
      \ 'csquotes Warning: No multilingual support',
      \]

let g:UltiSnipsExpandTrigger = ',,'
let g:UltiSnipsJumpForwardTrigger = ',,'

let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]
