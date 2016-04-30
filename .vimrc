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

" Register Settings
set clipboard^=unnamed,unnamedplus

" Leader
let mapleader = "\<Space>"

" Plugins
" ------------------------------------------------

" Requires plug.vim installed in the autoload directory.
" See https://github.com/junegunn/vim-plug for details.

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'basyura/unite-rails'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

call plug#end()

" Plugin Specific Settings
" ------------------------------------------------

" Unite.vim
nnoremap [unite] <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<Return>
nnoremap <silent> [unite]n :<C-u>Unite<Space>file/new<Return>
nnoremap <silent> [unite]r :<C-u>Unite<Space>file_mru<Return>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<Return>
nnoremap <silent> [unite]fp :<C-u>Unite<Space>file_rec/async:!<Return>
nnoremap <silent> [unite]gp :<C-u>call<Space><SID>unite_grep_in_project()<Return>

let g:unite_enable_start_insert = 1

" unite grep from project's root directory
function! s:unite_grep_in_project()
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite grep:' . dir
endfunction

" Use 'ag' instead of 'grep' if available
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" unite-rails
nnoremap [rails] <Nop>
nmap     <Space>r [rails]
nnoremap [rails]r :Unite<Space>rails/
nnoremap <silent> [rails]m :<C-u>Unite<Space>rails/model<Return>
nnoremap <silent> [rails]c :<C-u>Unite<Space>rails/controller<Return>
nnoremap <silent> [rails]v :<C-u>Unite<Space>rails/view<Return>
nnoremap <silent> [rails]h :<C-u>Unite<Space>rails/helper<Return>

" Key Bindings
" ------------------------------------------------

" Edit/Reload .vimrc
nnoremap <Space>fed :<C-u>edit $MYVIMRC<Return>
nnoremap <Space>feR :<C-u>source $MYVIMRC<Return>

" Swap up/down with up/down with display lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Load Your Local .vimrc
" ------------------------------------------------
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
