set colorcolumn=88
let g:ale_linters['css'] = ['stylelint']
let g:ale_fixers['css'] = ['prettier']
let g:ale_css_stylelint_options = '-c ~/.config/stylelint/.stylelintrc.json'
let g:ale_fix_on_save = 1
