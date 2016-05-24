" Load Your .vimrc preset
" ------------------------------------------------
" {{{1

if filereadable(expand('~/.vimrc.preset'))
  source ~/.vimrc.preset
endif

" }}}

" General Settings
" ------------------------------------------------
" {{{1

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

" Swap file location
if !isdirectory(expand('~/.vim/tmp'))
  call mkdir(expand('~/.vim/tmp'), 'p')
endif

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp

" Enable matchit
runtime macros/matchit.vim

" }}}

" General Key Bindings
" ------------------------------------------------
" {{{1

" Edit/Reload .vimrc
nnoremap <Leader>fed :<C-u>edit $MYVIMRC<Return>
nnoremap <Leader>feR :<C-u>source $MYVIMRC<Return>

" Swap up/down with up/down with display lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Previous/next buffer
nnoremap <silent> <C-h> :<C-u>bprevious<Return>
nnoremap <silent> <C-l> :<C-u>bNext<Return>

" The drill sergeant says "DON'T USE CURSOR KEYS, USE HJKL"
nnoremap <Left> :echoe<Space>"Use h"<Return>
nnoremap <Right> :echoe<Space>"Use l"<Return>
nnoremap <Up> :echoe<Space>"Use k"<Return>
nnoremap <Down> :echoe<Space>"Use j"<Return>

" Deleting a buffer without closing the window
nnoremap <silent> <leader>bd :bprevious\|:bdelete<Space>#<Return>

" }}}

" Plugins
" ------------------------------------------------
" {{{1

" Requires plug.vim installed in the autoload directory.
" See https://github.com/junegunn/vim-plug for details.

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'basyura/unite-rails'
Plug 'Shougo/unite-outline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'godlygeek/tabular', { 'for': 'markdown' } | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'kannokanno/previm', { 'for': 'markdown' }
Plug 'tyru/open-browser.vim', { 'for': 'markdown' }
Plug 'tyru/caw.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
Plug 'tpope/vim-rails'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell', 'cabal'] }

if get(g:, 'load_wakatime')
  Plug 'wakatime/vim-wakatime'
end

" Colorschemes
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'

call plug#end()

" }}}

" Plugin Specific Settings
" ------------------------------------------------
" {{{1

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

" NERDTree
nnoremap <silent> <Leader>nt :<C-u>NERDTreeToggle<Return>

" unite-rails
nnoremap [rails] <Nop>
nmap     <Leader>r [rails]
nnoremap [rails]r :Unite<Space>rails/
nnoremap <silent> [rails]m :<C-u>Unite<Space>rails/model<Return>
nnoremap <silent> [rails]c :<C-u>Unite<Space>rails/controller<Return>
nnoremap <silent> [rails]v :<C-u>Unite<Space>rails/view<Return>
nnoremap <silent> [rails]h :<C-u>Unite<Space>rails/helper<Return>

" unite-outline
nnoremap <silent> [unite]o :<C-u>Unite<Space>-vertical<Space>-no-quit<Space>-direction=botright<Space>-winwidth=35<Space>outline<Return>

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_match_window = 'bottom,order:btt,min:3,max:15,results:15'
let g:ctrlp_open_new_file = 'r'

" vim-easymotion
let g:EasyMotion_smartcase = 1

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vimagit
let g:magit_default_show_all_files = 2
let g:magit_default_fold_level = 2

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

" previm
nnoremap <silent> <Leader>mp :<C-u>PrevimOpen<Return>

" vim-anzu
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
nmap <silent> <Esc><Esc> :<C-u>nohlsearch<Return><Plug>(anzu-clear-search-status)

" vim-over
nnoremap <silent> <Leader>s :<C-u>OverCommandLine<Return>
xnoremap <silent> <Leader>s :<C-u>'<,'>OverCommandLine<Return>

" }}}

" Load Your Local .vimrc
" ------------------------------------------------
" {{{1

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}

" vim:set foldmethod=marker:
