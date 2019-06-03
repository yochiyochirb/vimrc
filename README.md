# vimrc

This is a Ruby/Rails-community-driven vimrc and aimed to help you to experience Vim in easy and comfortable ways.

- Continuous maintenance by the community
- Adorable key-bindings
- Providing Plugin set and basic ways to use them

## Prerequisites

This vimrc works only on Neovim/Vim8.0+ built with Python 3 interface (`if_python3`).

If you are using macOS and want to intall Vim with `if_python3`, it is super easy using Homebrew:

```
$ brew install vim --with-python3
```

You can check if Vim is built with `if_python3` by `:echo has("python3")`. If it returns 1, then you're OK.

Also, since some plugins (e.g. deoplete.nvim) require Neovim Python client, you might have to install it:

```
$ pip3 install neovim
```

## Installation

Clone this repository in anywhere you like:

```
$ git clone https://github.com/yochiyochirb/vimrc.git
```

Just run the setup script:

```
$ cd /path/to/vimrc # <= cd to where you clone the repository
$ ./setup # <= Run the setup script
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

## Update

Just run the setup script again and follow the instructions:

```
$ ./setup
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
- [papercolor](https://github.com/NLKNguyen/papercolor-theme)

Add the theme you prefer in `~/.vimrc.local`, like:

```vim
colorscheme molokai
```

See the website for each colorscheme for details.

### Indentation

Indent styles for major filetypes are defined in `.vim/after/ftplugin`. When you don't like them and want to change them, it's the recommended way to overwrite them in `.vimrc.local` instead of directly modify these files:

e.g.)

If you want to change HTML indent size from 2 spaces to 4 spaces, add the following to `.vimrc.local`:

```vim
augroup HTML
  autocmd!
  autocmd FileType html set tabstop=4
  autocmd FileType html set shiftwidth=4
  autocmd FileType html set softtabstop=4
augroup END
```

### Prettify JSON

You can prettify a JSON buffer by invoking `:PrettyJson`.
It uses `jq` by default and fallbacks to use Python 2.x if `jq` is not available.
You can also prettify a part of a buffer as a JSON by specifying range. Like this `:'<,'>PrettyJson`.

### vim-airline

vim-airline provides nice looking status line. Visit https://github.com/vim-airline/vim-airline for details.

Also, you can change vim-airline theme via vim-airline-themes by setting `let g:airline_theme='<theme name>'` in `~/.vimrc.local`, e.g.:

```vim
let g:airline_theme='simple'
```

You can find the full list ofg themes on https://github.com/vim-airline/vim-airline-themes

### Unite

The unite is a plugin which can search and display information from arbitrary sources like files, buffers or recently used files.

However, Unite will be replaced with Denite in near future because the plugin author of Unite states that active development of Unite has stopped, so there exists Unite only for backward compatibility.

### unite-outline

unite-outline is a unite plugin for current buffer outline view.

- `<Leader>uo` : to "unite" outline into right window which is not close.

For more information, visit https://github.com/Shougo/unite-outline or `:help unite-outline`.

### unite-turnip

If you use [Turnip](https://github.com/jnicklas/turnip), unite-turnip will help you.

Type `:Unite turnip` to list existing turnip steps.

For more information, visit https://github.com/mtsmfm/unite-turnip .

### Denite.nvim

Denite.nvim is to unite all interfaces for NeoVim/Vim.

A few things at least you have to know about Denite are:

- It requires Neovim or Vim 8.0+ with if_python3
- `j` : to move to next line
- `k` : to move to previous line
- `q` : to close "denite" window
- `i` : to move to filter buffer
- `<Leader>ur` : to "denite" recently opened files
- `<Leader>ub` : to "denite" buffers
- `<Leader>ufp` : to "denite" find files in the project (e.g. for files in git repository)
  - It is alomost the same as CtrlP
- `<Leader>ugp` : to "denite" grep files in the project (e.g. from files in git repository)
  - ag will be used as grep source if available

For more information, visit https://github.com/Shougo/denite.nvim or `:help denite`.

### denite-rails

denite-rails is a denite source for rails.

A few things at least you have to know about denite-rails are:

- `<Leader>rr` : to "denite" dwim (Do What I Mean)
  - This is maybe the most useful command which lists files related to the current buffer
- `<Leader>rm` : to "denite" model files
- `<Leader>rc` : to "denite" controller files
- `<Leader>rv` : to "denite" view files
- `<Leader>rh` : to "denite" helper files
- `<Leader>rt` : to "denite" test files

For more information, visit https://github.com/5t111111/denite-rails

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

### previm

previm is a plugin for Realtime preview (Markdown only for the moment).

The one thing at least you have to know about previm is:

- `<Leader>mp` : to preview markdown in a web browser

For more information, visit https://github.com/previm/previm or `:help previm`.

### open-browser-github

open-browser-github is a plugin to open current file (or issue, etc.) in GitHub.

A few things at least you have to know about open-browser-github are:

- `:OpenGithubFile` : to open current file's URL in GitHub
- `:'<,'>OpenGithubFile` : to open current file's URL in GitHub with highlight
- `:OpenGithubFile path/to/file` : to open a specific file in GitHub
- `:OpenGithubProject` : to open current resipotory top page in GitHub
- `:OpenGithubIssue` : to open current repository issue list in GitHub
- `:OpenGithubIssue 1` : to open current repository issue (or pull request) #1 in GitHub
- `:OpenGithubPullReq` : to open current repository pull request list in GitHub
- `:OpenGithubPullReq 1` : same as `:OpenGithubIssue 1`

For more information, visit https://github.com/tyru/open-browser-github.vim or `:help openbrowser-github`.

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

- `Ctrl + p` : open ctrlp, then show magaged files via `git ls-files`

For more information, visit https://github.com/ctrlpvim/ctrlp.vim or `:help ctrlp`.

**[Advanced]** Since CtrlP also provides the ways to customize matcher/file listup command, you can change them if you want by modifying `~/.vimrc.preset` .

- if you want to use [cpsm](https://github.com/nixprime/cpsm) as the matcher, uncomment `let g:load_cpsm = 1`

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

### ALE (Asynchronous Lint Engine)

ALE is a plugin for providing asynchronous linting. It requires NeoVim 0.2.0+ and Vim 8.

For more information, visit https://github.com/w0rp/ale or `:help ale`.

### vim-surround

This plugin is a tool for dealing with pairs of "surroundings." Examples of surroundings include parentheses, quotes, and HTML tags.
They are closely related to what Vim refers to as |text-objects|.
Provided are mappings to allow for removing, changing, and adding surroundings.

Details follow on the exact semantics, but first, consider the following
examples.  An asterisk (\*) is used to denote the cursor position.

| Old text                | Command   | New text ~                  |
| :---------------------- | :-------- | :-------------------------- |
| `"Hello *world!"`       | `ds"`     | `Hello world!`              |
| `[123+4*56]/2`          | `cs])`    | `(123+456)/2`               |
| `"Look ma, I'm *HTML!"` | `cs"<q>`  | `<q>Look ma, I'm HTML!</q>` |
| `if *x>3 {`             | `ysW(`    | `if ( x>3 ) {`              |
| `my $str = *whee!;`     | `vllllS'` | `my $str = 'whee!';`        |

For more information, visit https://github.com/tpope/vim-surround or `:help surround`.

### Neosnippet

The Neosnippet plug-In adds snippet support to Vim. Snippets are small templates for commonly used code that you can fill in on the fly. You can choose snippets with the neocomplcache / neocomplete interface.

1. Open Ruby file (`*.rb`)
2. Input `def` then select a snippet candidate
3. `Ctrl + k` to expand a selected snippet
4. Enter a method name and press `Ctrl + k` again to select the next input

The other few things at least you have to know about Neosnippet are:

- You can see all defaut built-in snippet list [here](https://github.com/Shougo/neosnippet-snippets/tree/master/neosnippets)
- If you want to add new snippets, add `*.snip` to `.vim/snippets`.

For more information, visit https://github.com/Shougo/neosnippet.vim or `:help neosnippet`.

### vimwiki

vimwiki constructs wiki in local. Default dir for wiki is `~/vimwiki` and file extension is markdown in this setting.
If you want to use vimwiki, uncomment `let g:load_vimwiki = 1` in `~/.vimrc.preset` .

- `<Leader>ww`: Open wiki home `~/vimwiki/index.md`

This plugin works with calendar-vim. Press `Enter` on calendar view, Create a new wiki `~/vimwiki/diary/YYYY-MM-DD.md` and open it.

#### little tips

- Press `Enter` on a some word, make it link style. Then Press `Enter` again, create new page for it and open it.
- Press `C-Space` on check list, toggle check on/off

For more information, visit https://github.com/vimwiki/vimwiki or `:help vimwiki`.

#### advanced configuration

If you would rather set the vimwiki location other than the default `~/vimwiki`, add the below settings to `~/.vimrc.local` (change `path` to any location you want) .

```vim
let g:vimwiki_list = [{
  \ 'path': '/path/to/directory/you/prefer',
  \ 'syntax': 'markdown', 'ext': '.md'
\}]
```

### calendar-vim

There is no need to leave vim for viewing calendar.

- `<Leader>cal`: Vertically-split calendar
- `<Leader>caL`: Horizontally-split calendar

For more information, visit https://github.com/mattn/calendar-vim or `:help calendar`.

### rufo-vim

Auto Ruby formatter for vim via [rufo](https://github.com/asterite/rufo). If you want to enable auto formatting by default, install `rufo` gem and add the below line to your ~/.vimrc.local :

```vim
let g:rufo_auto_formatting = 1
```

- `:Rufo`: Run formatting
- `:RufoOn`: Enable auto formatting
- `:RufoOff`: Disable auto formatting

For more information, visit https://github.com/splattael/rufo-vim .
