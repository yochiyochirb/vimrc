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

" Plugins
" ------------------------------------------------

" Requires plug.vim installed in the autoload directory.
" See https://github.com/junegunn/vim-plug for details.

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'basyura/unite-rails'
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
nnoremap <silent> [unite]p :<C-u>Unite<Space>file_rec/async:!<Return>

let g:unite_enable_start_insert = 1

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
