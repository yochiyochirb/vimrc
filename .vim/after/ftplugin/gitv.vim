if exists('b:did_ftplugin_gitv')
  finish
endif
let b:did_ftplugin_gitv = 1

highlight diffAdded ctermfg=green
highlight diffRemoved ctermfg=red
