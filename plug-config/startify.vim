let g:startify_lists = [
            \ { 'type': 'bookmarks',  'header': ['Bookmarks'        ]},
            \ { 'type': 'files',      'header': ['Files'            ]},
            \ { 'type': 'dir',        'header': ['Current Directory']}
            \ ]

let g:startify_bookmarks = [
            \ {'a': '~/TODO.md'},
            \ {'b': '~/.config/nvim/init.vim'},
            \ {'c': '~/.config/nvim/snips/tex.snippets'},
            \ {'d': '~/planck_layout'},
            \ {'e': '~/crkbd_layout'}
            \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 0
let g:startify_files_number = 15
let g:startify_enable_special = 0

let g:startify_custom_header = startify#fortune#boxed()
