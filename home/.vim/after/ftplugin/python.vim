set colorcolumn=88
let g:ale_linters['python'] = ['ruff', 'mypy']
let g:ale_fixers['python'] = ['black', 'ruff']
let g:ale_fix_on_save = 1
let b:ale_enabled = 1
