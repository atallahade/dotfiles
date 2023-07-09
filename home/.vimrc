unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ycm-core/YouCompleteMe'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'psf/black', { 'branch': 'stable' }
Plug 'preservim/tagbar'
call plug#end()

let mapleader = ","

" Disable mouse
set mouse=
set ttymouse=
" CTRL + Arrow to manipulate tabs
nnoremap <C-S-LEFT>      :tabprevious<CR>
nnoremap <C-S-RIGHT>     :tabnext<CR>
nnoremap <C-S-DOWN>      :+tabmove<CR>
nnoremap <C-S-UP>        :-tabmove<CR>
nnoremap <Leader>j       :tabnext<CR>
nnoremap <Leader>k       :tabprevious<CR>
nnoremap <Leader><S-j>   :+tabmove<CR>
nnoremap <Leader><S-k>   :-tabmove<CR>
set term=xterm-256color

colorscheme jellybeans

syntax on
set noshowmode  " already with vim-airline
set number
set ruler
" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
" Tabs
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=0
set wrapmargin=0
set softtabstop=2

"Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Auto close brace
inoremap {<CR> {<CR>}<ESC>O

" 4 lines offset at the bottom
set scrolloff=4

set smartindent
" Stop putting # to first column
set cindent
set cinkeys-=0#
set indentkeys-=0#

set history=1000

" Enable spellchecking
let g:spell_enable = 0
nmap <Leader>s :call SpellcheckToggle()<cr>

function! SpellcheckToggle()
  if g:spell_enable
    setlocal nospell
  else
    setlocal spell spelllang=en_us
  endif
  let g:spell_enable = !g:spell_enable
endfunction

" ALE config
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters_explicit = 1

" CTRL-t to toggle tree view with CTRL-t
nmap <silent> <C-t>      :NERDTreeToggle<CR>

" airline
set laststatus=2    " Show status bar at startup
set ttimeoutlen=10  " Fix slow mode update

" No highlight
nmap <Leader><Space> :noh<CR>

" Disable YCM help box on hover
let g:ycm_auto_hover=''
" Press F3 to toggle the help box
nmap <F3> <plug>(YCMHover)
" Remove preview window
set completeopt-=preview

nmap <C-i> :TagbarToggle<CR><C-w>w

set shell=bash
