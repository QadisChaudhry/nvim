let g:ale_linters = {'python': ['flake8'], 'vim': ['vlint']}
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1
let g:ale_pattern_options = {'\.tex$': {'ale_enabled': 0}}
