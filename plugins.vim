if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter' "Git support
    Plug 'artur-shaik/vim-javacomplete2'
    Plug 'udalov/kotlin-vim'
    Plug 'dense-analysis/ale'
    Plug 'junegunn/goyo.vim'
    Plug 'whonore/Coqtail'
    Plug 'vim-scripts/lustre-syntax'
    " Plug 'alvan/vim-closetag'
    " Plug 'gko/vim-coloresque'
    Plug 'Yggdroot/indentLine'
    Plug 'cohama/lexima.vim'
call plug#end()

nmap ( <Plug>(GitGutterNextHunk)
nmap ) <Plug>(GitGutterPrevHunk)


" Javacomplete2 configuration
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType kotlin setlocal omnifunc=javacomplete#Complete
inoremap <C-Space> <C-x><C-o>

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)


" IndentLine configuration
set conceallevel=2
let g:indentLine_char = '|'
