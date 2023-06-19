set colorcolumn=88
let g:ale_linters['css'] = ['stylelint2']
let g:ale_fixers['css'] = ['prettier']
let g:ale_css_stylelint_options = "-c /home/adel/.config/stylelint/.stylelintrc.json --config-basedir /usr/local/lib/"
let g:ale_fix_on_save = 1
call ale#linter#Define('css', {
\   'name': 'stylelint2',
\   'executable': {b -> ale#path#FindExecutable(b, 'css_stylelint', [
\       'node_modules/.bin/stylelint',
\   ])},
\   'command': function('ale_linters#css#stylelint#GetCommand'),
\   'callback': 'ale#handlers#css#HandleStyleLintFormat',
\   'output_stream': 'stderr',
\})
