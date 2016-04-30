" General Settings
" ------------------------------------------------
syntax on
filetype plugin indent on

" Buffer Settings
set hidden

" Tab/Indent Settings
set smartindent

" Search Settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Editor Settings
set number
set backspace=indent,eol,start

" Display Settings
set title
set laststatus=2

" Register Settings
set clipboard^=unnamed,unnamedplus

" Leader
let mapleader = "\<Space>"

" General Key Bindings
" ------------------------------------------------
" Edit/Reload .vimrc
nnoremap <Leader>fed :<C-u>edit $MYVIMRC<Return>
nnoremap <Leader>feR :<C-u>source $MYVIMRC<Return>

" Swap up/down with up/down with display lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Plugins
" ------------------------------------------------
" Requires plug.vim installed in the autoload directory.
" See https://github.com/junegunn/vim-plug for details.

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'basyura/unite-rails'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

call plug#end()

" Plugin Specific Settings
" ------------------------------------------------
" Unite.vim
nnoremap [unite] <Nop>
nmap     <Leader>u [unite]
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<Return>
nnoremap <silent> [unite]n :<C-u>Unite<Space>file/new<Return>
nnoremap <silent> [unite]r :<C-u>Unite<Space>file_mru<Return>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<Return>
nnoremap <silent> [unite]fp :<C-u>call<Space><SID>unite_do_in_project('file_rec/async:')<Return>
nnoremap <silent> [unite]gp :<C-u>call<Space><SID>unite_do_in_project('grep:')<Return>

let g:unite_enable_start_insert = 1

" unite do from project's root directory
function! s:unite_do_in_project(source)
  let l:project_root = unite#util#path2project_directory(expand('%'))
  execute 'Unite ' . a:source . l:project_root
endfunction

" Use 'ag' instead of 'grep' if available
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" unite-rails
nnoremap [rails] <Nop>
nmap     <Leader>r [rails]
nnoremap [rails]r :Unite<Space>rails/
nnoremap <silent> [rails]m :<C-u>Unite<Space>rails/model<Return>
nnoremap <silent> [rails]c :<C-u>Unite<Space>rails/controller<Return>
nnoremap <silent> [rails]v :<C-u>Unite<Space>rails/view<Return>
nnoremap <silent> [rails]h :<C-u>Unite<Space>rails/helper<Return>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vimagit
let g:magit_default_show_all_files = 2
let g:magit_default_fold_level = 2

" Load Your Local .vimrc
" ------------------------------------------------
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
