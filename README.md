# vimrc

This is a Ruby/Rails-community-driven vimrc and aimed to help you to experience Vim in easy and comfortable ways.

- Continuous maintenance by the community
- Adorable key-bindings
- Providing Plugin set and basic ways to use them

## Installation

Clone this repository in anywhere you like:

```
$ git clone https://github.com/yochiyochirb/vimrc.git
```

Just run the installation script:

```
$ cd /path/to/vimrc # <= cd to where you clone the repository
$ ./install # <= Run the installation script
```

## Install Plugins

We use `vim-plug` for plugin management, so you should install it before continue.

```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Start Vim.

```
$ vim
```

Setup plugins.

```
:PlugInstall
```

## Quickstart Guides

### Folding

If you find some troubles with reading `vimrc` by every section is folded. Just type `zR`, then all foldings are open, or hit `Space` to open each folding.

### Leader

By default, Leader key is mapped to `Space`.

### Colorschemes

The following additional coloschemes are available:

- [molokai](https://github.com/tomasr/molokai)
- [badwolf](https://github.com/sjl/badwolf)
- [solarized](https://github.com/altercation/vim-colors-solarized)
- [dracula](https://github.com/dracula/vim)

Add the theme you prefer in `~/.vimrc.local`, like:

```vim
colorscheme molokai
```

See the website for each colorscheme for details.

### Unite

The unite is a plugin which can search and display information from arbitrary sources like files, buffers or recently used files.

A few things at least you have to know about Unite are:

- `<Leader>ur` : to "unite" recently opened files
- `<Leader>ub` : to "unite" buffers
- `<Leader>ufp` : to "unite" find files in the project (e.g. for files in git repository)
- `<Leader>ugp` : to "unite" grep files in the project (e.g. from files in git repository)

For more information, visit https://github.com/Shougo/unite.vim or `:help unite`.

### unite-rails

unite-rails is a unite plugin for rails.

A few things at least you have to know about unite-rails are:

- `<Leader>rm` : to "unite" models
- `<Leader>rc` : to "unite" controllers
- `<Leader>rv` : to "unite" views
- `<Leader>rh` : to "unite" helpers

For more information, visit https://github.com/basyura/unite-rails or `:help unite-rails`.

### unite-outline

unite-outline is a unite plugin for current buffer outline view.

- `<Leader>uo` : to "unite" outline into right window which is not close.

For more information, visit https://github.com/Shougo/unite-outline or `:help unite-outline`.

### easymotion

Easymotion brings you to the location you want really fast. 

The one thing at least you have to know about easymotion is:

- `<Leader><Leader>s` : then type any character for the word you want to move to

For more information, visit https://github.com/easymotion/vim-easymotion or `:help easymotion`.

### vim-easy-align

vim-easy-align is a simple, easy-to-use Vim alignment plugin.

A few things at least you have to know about vim-easy-align are:

1. Select lines to align in visual mode
2. `ga` : to start easy-align
3. enter delimiter for aligning

e.g.

```
lorem=ipsum
dolor = sit
amet = consectetur
```

Select lines then `ga` then `=`

```
lorem = ipsum
dolor = sit
amet  = consectetur
```

This is also very useful for markdown tables:

1. Select table to align in visual mode
2. `ga` : to start easy-align
3. enter `*` to target all columns
3. enter delimiter for aligning

e.g.

```
key|value|note
--|--|--
key1|value1|note1
key22|value22|note22
key333|value333|note333
```

Select lines then `ga` then `*|`

```
key    | value    | note
--     | --       | --
key1   | value1   | note1
key22  | value22  | note22
key333 | value333 | note333
```

For more information, visit https://github.com/junegunn/vim-easy-align or `:help easyalign`.

### NERDTree

A few things at least you have to know about NERDTree are:

- `<Leader>nt` : to toggle NERDTree
- `I` : to toggle displaying hidden files
- `Return` : to open file/directory
- Displays Git status with [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)

For more information, visit https://github.com/scrooloose/nerdtree or `:help NERDTree`.

### vimagit

vimagit is a new way to use git within vim.

A few things at least you have to know about vimagit are:

- `<Leader>M` : to open vimagit
- `N` : to go to next hunk
- `S` : to add file/hunk to stage
- `CC` : to commit staged file/hunk, `CC` again for committing after writing commit message

For more information, visit https://github.com/jreybert/vimagit or `:help vimagit`.

### previm

previm is a plugin for Realtime preview (Markdown only for the moment).

The one thing at least you have to know about previm is:

- `<Leader>mp` : to preview markdown in a web browser

For more information, visit https://github.com/kannokanno/previm or `:help previm`.

### caw

caw is a comment plugin.

The one thing at least you have to know about caw is:

- `gcc` : to comment/uncomment

For more information, visit https://github.com/tyru/caw.vim or `:help caw`.

### vim-anzu

vim-anzu is a search plugin that displays current match/total matches.

A few things at least you have to know about vim-anzu are:

1. `/` / `?` to start search then hit `n` / `N`
2. current match/total matches are displayed in vim-airline

- `*` and `#` are also worked as anzu search

For more information, visit https://github.com/osyo-manga/vim-anzu or `:help anzu`.

### vim-over

A few things at least you have to know about vim-over are:

- `<Leader>s` : then input a substitute command like `%s/foo/bar/g`, whoa!
- vim-over requires Vim 7.3 or above and compiles with `+conceal`
  - Since Vim which comes with OS X does not have `+conceal`, you might have to install Vim via Homebrew

For more information, visit https://github.com/osyo-manga/vim-over or `:help over`.

### vim-better-whitespace

vim-better-whitespace is a plugin which causes all trailing whitespace characters (spaces and tabs) to be highlighted.

A few things at least you have to know about vim-better-whitespace are:

- `:ToggleWhitespace` : to toggle whitespace highlighting on/off (on by default)
- `:StripWhitespace` : to clean all extra whitespaces

### CtrlP

CtrlP is a full path fuzzy file etc finder for vim.

- `Ctrl + p` : open ctrlp, then show magaged files via git

For more information, visit https://github.com/ctrlpvim/ctrlp.vim or `:help ctrlp`.

**[Advanced]** Since CtrlP also provides the ways to customize matcher/file listup command, you can change them if you want by modifying `~/.vimrc.preset` .

- if you want to use [cpsm](https://github.com/nixprime/cpsm) as the matcher, uncomment `let g:load_cpsm = 1`
- if you want to use [files](https://github.com/mattn/files) for file listing, uncomment `let g:ctrlp_use_files = 1`

### vim-blockle

vim-blockle is block syntax toggle plugin.

- `<Leader>b` : Convert `{ ... }` into `do ... end` and vice versa.

For more information, visit https://github.com/jgdavey/vim-blockle or `:help blockle`.

### vim-wakatime

vim-wakatime is a plugin for [WakaTime](https://wakatime.com/). It requires to sign up WakaTime and input API key. If you want to use it, uncomment `let g:load_wakatime = 1` in `~/.vimrc.preset` .

For more information, visit https://wakatime.com/help/plugins/vim

### vim-migemo

vim-migemo is a plugin for [migemo (cmigemo)](http://www.kaoriya.net/software/cmigemo/) search. It requires cmigemo (When using OS X, you can install it via `brew install cmigemo`.

- `g/` or `<Leader>mi` to start migemo search
- You can search a word with "Okurigana" by using upper characters (e.g. 'jikkouSuru' for '実行する')

For more information, visit https://github.com/haya14busa/vim-migemo

### Neomake (only on Neovim)

Neomake is a plugin for asynchronous `:make`. If you want to use it, uncomment `let g:load_neomake = 1` in `~/.vimrc.preset` .

For more information, visit https://github.com/neomake/neomake
