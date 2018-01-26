set colorcolumn=100

nnoremap <C-d> :YcmCompleter GetDoc<CR>
inoremap <C-d> :YcmCompleter GetDoc<CR>

nnoremap <C-c> :CargoRun<CR>

"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror

"autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
"autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet"
