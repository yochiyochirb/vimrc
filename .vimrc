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

Plug 'Shougo/neomru.vim', { 'on':  'Unite' }
Plug 'Shougo/unite.vim', { 'on': 'Unite' }
Plug 'basyura/unite-rails', { 'on': 'Unite' }
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

call plug#end()

" Plugin Specific Settings
" ------------------------------------------------

" Unite.vim
nnoremap [unite] <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]f :Unite<Space>file<Return>
nnoremap <silent> [unite]n :Unite<Space>file/new<Return>
nnoremap <silent> [unite]r :Unite<Space>file_mru<Return>
nnoremap <silent> [unite]b :Unite<Space>buffer<Return>

let g:unite_enable_start_insert = 1

" unite-rails
nnoremap [rails] <Nop>
nmap     <Space>r [rails]
nnoremap [rails]r :Unite<Space>rails/
nnoremap <silent> [rails]m :Unite<Space>rails/model<Return>
nnoremap <silent> [rails]c :Unite<Space>rails/controller<Return>
nnoremap <silent> [rails]v :Unite<Space>rails/view<Return>
nnoremap <silent> [rails]h :Unite<Space>rails/helper<Return>

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
