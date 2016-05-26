if exists('b:did_ftplugin_ruby')
  finish
endif
let b:did_ftplugin_ruby = 1

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=0

" Convert to new Hash syntax
nnoremap <Leader><Leader>rh :<C-u>%s/:\([^ ]*\)\(\s*\)=>/\1:/g<Return>
xnoremap <Leader><Leader>rh :<C-u>'<,'>s/:\([^ ]*\)\(\s*\)=>/\1:/g<Return>
