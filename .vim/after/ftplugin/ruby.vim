set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0

" Convert to new Hash syntax
nnoremap <Leader><Leader>rh :<C-u>%s/:\([^ ]*\)\(\s*\)=>/\1:/g<Return>
xnoremap <Leader><Leader>rh :<C-u>'<,'>s/:\([^ ]*\)\(\s*\)=>/\1:/g<Return>
