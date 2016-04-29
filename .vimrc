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

noremap  j gj
noremap  k gk
noremap gj  j
noremap gk  k

nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

nnoremap <Space>db :bdelete<Enter>

" color of line number
autocmd ColorScheme * highlight LineNr ctermfg=245

filetype plugin indent on
