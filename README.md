# vimrc

This is a Ruby/Rails-community-driven vimrc and aimed to help you to experience Vim in easy and comfortable ways.

- Continuous maintenance by the community
- Adorable key-bindings
- Providing Plugin set and basic ways to use them

## Installation

Backup your current `.vimrc` and `.vim`.

```
$ cd ~
$ mv .vimrc .vimrc.bak
$ mv .vim .vim.bak
```

Clone this repository.

```
$ git clone https://github.com/5t111111/vimrc
```

Create a symbolic link to `.vim`.

```
$ ln -s /path/to/vimrc/.vim ~/.vim
```

Create a symbolic link to `.vimrc`.

```
$ ln -s /path/to/vimrc/.vimrc ~/.vimrc
```

* neovim  
  ```
  $ ln -s /path/to/vimrc/.vimrc ~/.vim/init.vim
  ```
  You still need to create a symbolic link in `~/.config` when using neovim.


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

### Unite

A few things at least you have to know about Unite are:

- `<Leader>ur` : to "unite" recently opened files
- `<Leader>ub` : to "unite" buffers
- `<Leader>ufp` : to "unite" find files in the project (e.g. for files in git repository)
- `<Leader>ufp` : to "unite" grep files in the project (e.g. from files ingit repository)

### unite-rails

A few things at least you have to know about unite-rails are:

- `<Leader>rm` : to "unite" models
- `<Leader>rc` : to "unite" controllers
- `<Leader>rv` : to "unite" views
- `<Leader>rh` : to "unite" helpers

### easymotion

Easymotion brings you to the location you want really fast. 

The one thing at least you have to know about easymotion is:

- `<Leader><Leader>s` : then type any character for the word you want to move to

### NERDTree

A few things at least you have to know about NERDTree are:

- `<Leader>nt` : to toggle NERDTree
- `I` : to toggle displaying hidden files
- `Return` : to open file/directory

### vimagit

A few things at least you have to know about vimagit are:

- `<Leader>M` : to open vimagit
- `N` : to go to next hunk
- `S` : to add file/hunk to stage
- `CC` : to commit staged file/hunk, `CC` again for committing after writing commit message

### vim-over

A few things at least you have to know about vim-over are:

- `<Leader>s` : then input a substitute command like `%s/foo/bar/g`, whoa!
