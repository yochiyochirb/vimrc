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

" Define and re-initialize augroup for vimrc
augroup vimrc
  autocmd!
augroup END

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

" Wildmode settings for Zsh like completion
set wildmenu
set wildmode=longest,full

" Register Settings
if has('nvim')
  set clipboard+=unnamedplus
else
  set clipboard^=unnamed,unnamedplus
endif

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

" Switch buffer "DON'T USE CURSOR KEYS, USE HJKL"
nnoremap <Left> :<C-u>bprevious<Return>
nnoremap <Right> :<C-u>bNext<Return>

" The drill sergeant says "DON'T USE CURSOR KEYS, USE HJKL"
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
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'basyura/unite-rails'
Plug 'Shougo/unite-outline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'godlygeek/tabular', { 'for': 'markdown' } | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'kannokanno/previm', { 'for': 'markdown' }
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
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
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] } | Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'sunaku/vim-ruby-minitest'
Plug 'haya14busa/vim-migemo'
Plug 'mattn/calendar-vim'
Plug 'mtsmfm/unite-turnip'

if get(g:, 'load_wakatime')
  Plug 'wakatime/vim-wakatime'
endif

if get(g:, 'load_cpsm')
  Plug 'nixprime/cpsm', { 'do': 'env PY3=ON ./install.sh' }
endif

if get(g:, 'load_vimwiki')
  Plug 'vimwiki/vimwiki'
endif

if get(g:, 'load_denite')
  if !has('nvim')
    Plug 'Shougo/denite.nvim'
  endif
endif

if get(g:, 'load_syntastic')
  Plug 'scrooloose/syntastic'
else
  Plug 'neomake/neomake'
endif

" Colorschemes
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'benreic/peakseacolor'

" Vim/Neovim specific plugins
if has('nvim')
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction

  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

  if get(g:, 'load_denite')
    Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }
  endif
else
  if has('lua')
    Plug 'Shougo/neocomplete.vim'
  endif
endif

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

" Denite.vim
if get(g:, 'load_denite')
  nnoremap <silent> [unite]r :<C-u>Denite<Space>file_mru<Return>
  nnoremap <silent> [unite]b :<C-u>Denite<Space>buffer<Return>
  nnoremap <silent> [unite]fp :<C-u>Denite<Space>file_rec<Return>
  nnoremap <silent> [unite]gp :<C-u>Denite<Space>grep<Return>
  nnoremap <silent> [unite]l :<C-u>Denite<Space>line<Return>
  nnoremap <silent> [unite]u :<C-u>Denite<Space>-resume<Return>

  call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map('insert', '<C-x>', '<denite:input_command_line>', 'noremap')

  " Use 'ag' instead of 'grep' if available
  if executable('ag')
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts',
                    \ ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif
endif

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'

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

" CtrlP
if get(g:, 'load_cpsm')
  let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

  " Denite.vim integration
  if get(g:, 'load_denite')
    call denite#custom#source('file_rec', 'matcher', ['matcher_cpsm'])
  endif
endif

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'git -C %s ls-files --cached --exclude-standard --others'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
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

" vim-migemo
nmap <silent> g/ <Plug>(migemo-migemosearch)

" Vim/Neovim specific plugin settings
if has('nvim')
  " deoplete.nvim
  let g:deoplete#enable_at_startup = 1
else
  if has('lua')
    " neocomplete.vim
    let g:neocomplete#enable_at_startup = 1
  endif
endif

if get(g:, 'load_syntastic')
  " Syntastic
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'python'] }
  let g:syntastic_ruby_checkers = ['rubocop', 'mri']
  let g:syntastic_python_checkers = ['flake8']
else
  " neomake
  autocmd vimrc BufEnter,BufWritePost * Neomake
  let g:neomake_verbose = 0
endif

" vim-go
" See https://github.com/fatih/vim-go#example-mappings for mapping details
autocmd FileType go nmap <Leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage)
autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
autocmd FileType go nmap <Leader>s <Plug>(go-implements)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>e <Plug>(go-rename)

" vimwiki
let g:vimwiki_list = [{
  \ 'path': '~/vimwiki/',
  \ 'syntax': 'markdown', 'ext': '.md'
\}]
let g:vimwiki_global_ext = 0
let g:vimwiki_use_calendar = 1

" }}}

" Load Your Local .vimrc
" ------------------------------------------------
" {{{1

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}

" vim:set foldmethod=marker:
