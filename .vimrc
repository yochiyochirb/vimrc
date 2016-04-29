syntax on

set hidden
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set clipboard+=unnamed
set hlsearch
set incsearch
set backspace=indent,eol,start

" Edit/Reload .vimrc
nnoremap <Space>fed :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>feR :<C-u>source $MYVIMRC<Enter>

" Swap up/down with up/down with display lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

filetype plugin indent on
