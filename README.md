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

If you find a trouble with reading `vimrc` by every section is folded. Just type `zR`, then all foldings are open.

### Leader

By default, Leader key is mapped to `Space`.

### Unite

The 4 things least you have to know about Unite are:

- `<Space>ur` : to "unite" recently opened files
- `<Space>ub` : to "unite" buffers
- `<Space>ufp` : to "unite" find files in the project (e.g. for files in git repository)
- `<Space>ufp` : to "unite" grep files in the project (e.g. from files ingit repository)

### easymotion

Easymotion brings you to the location you want really fast. 

The 1 thing least you have to know about easymotion is:

- `<Space><Space>s` : then type any character for the word you want to move to

### vim-over

The 1 thing you have to know about vim-over is:

- `<Space>s` : then input a substitute command like `%s/foo/bar/g`, whoa!

