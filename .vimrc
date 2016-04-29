" General Settings
" ------------------------------------------------
syntax on
filetype plugin indent on

" Buffer Settings
set hidden

" Tab/Indent Settings
set autoindent

" Search Settings
set hlsearch
set incsearch

" Editor Settings
set number
set backspace=indent,eol,start

" Register Settings
set clipboard^=unnamed,unnamedplus

" Key Bindings
" ------------------------------------------------

" Edit/Reload .vimrc
nnoremap <Space>fed :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>feR :<C-u>source $MYVIMRC<Enter>

" Swap up/down with up/down with display lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
