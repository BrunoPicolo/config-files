"__     ___
"\ \   / (_)_ __ ___  _ __ ___
" \ \ / /| | '_ ` _ \| '__/ __|
"  \ V / | | | | | | | | | (__
"   \_/  |_|_| |_| |_|_|  \___|
" _             ____                           ____  _           _
"| |__  _   _  | __ ) _ __ _   _ _ __   ___   |  _ \(_) ___ ___ | | ___
"| '_ \| | | | |  _ \| '__| | | | '_ \ / _ \  | |_) | |/ __/ _ \| |/ _ \
"| |_) | |_| | | |_) | |  | |_| | | | | (_) | |  __/| | (_| (_) | | (_) |
"|_.__/ \__, | |____/|_|   \__,_|_| |_|\___/  |_|   |_|\___\___/|_|\___/
"       |___/

" Set the map leader to \
    let mapleader="\\"

" PlugInstall to install plugins
" PlugUpdate to update plugins
" PlugStatus to Check plugin status
" PlugClear to clear the unused plugins
call plug#begin('~/.vim/plugged')
    Plug 'LukeSmithxyz/vimling'
    Plug 'tpope/vim-surround'
    Plug 'xuhdev/vim-latex-live-preview'
    Plug 'scrooloose/nerdtree'
    Plug 'easymotion/vim-easymotion'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'neoclide/coc.nvim', {'branch' : 'release'}
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'scrooloose/nerdcommenter'
    " Plug 'junegunn/goyo.vim'
    " Plug 'arcticicestudio/nord-vim'
    " https://github.com/scrooloose/vim-slumlord - To create UML on vim?
call plug#end()


""" Plugins configuration
    " Map F1 to preview latex documents
    autocmd FileType tex map <F1> :LLPStartPreview<CR>
    map <leader>o : set spell! spelllang=fr<CR>
    map <leader>e : set spelllang=en<CR>
    " To change the github nerdTree symbols
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
    " Highlight currently open buffer in NERDTree
    " autocmd BufEnter * call SyncTree()

    """ Coc configuration ''' Search for docker coc extension '''
        let g:coc_global_extensions = [
            \ 'coc-word',
            \ 'coc-docker',
            \ 'coc-ccls',
            \ 'coc-css',
            \ 'coc-java',
            \ 'coc-git',
            \ 'coc-html',
            \ 'coc-texlab',
            \ 'coc-python',
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-json',
            \ ]
         " if hidden is not set, TextEdit might fail.
         set hidden""
         " Some servers have issues with backup files, see #649
         set nobackup
         set nowritebackup
         " Better display for messages
         set cmdheight=2
         " You will have bad experience for diagnostic messages when its default 4000.
         set updatetime=300
         " don't give |ins-completion-menu| messages
         set shortmess+=c
         " always show signcolumns
         set signcolumn=yes
         " Use tab for trigger completion with characters ahead and navigate.
         " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
         inoremap <silent><expr> <TAB>
               \ pumvisible() ? "\<C-n>" :
               \ <SID>check_back_space() ? "\<TAB>" :
               \ coc#refresh()
         inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
         function! s:check_back_space() abort
           let col = col('.') - 1
           return !col || getline('.')[col - 1]  =~# '\s'
         endfunction
         " Use <"c-space> to trigger completion.
         inoremap <silent><expr> <c-space> coc#refresh()
         " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
         " Coc only does snippet and additional edit on confirm.
         inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
         " Or use `complete_info` if your vim support it, like:
         " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? \<C-y>" : "\<C-g>u\<CR>"
         " Use `[g` and `]g` to navigate diagnostics
         nmap <silent> [g <Plug>(coc-diagnostic-prev)
         nmap <silent> ]g <Plug>(coc-diagnostic-next)
         " Remap keys for gotos
         nmap <silent> gd <Plug>(coc-definition)
         nmap <silent> gy <Plug>(coc-type-definition)
         nmap <silent> gi <Plug>(coc-implementation)
         nmap <silent> gr <Plug>(coc-references)
         " Use K to show documentation in preview window
         nnoremap <silent> K :call <SID>show_documentation()<CR>
         function! s:show_documentation()
             if (index(['vim', 'help'], &filetype) >= 0)
                 execute 'h '.expand('<cword>')'
             else
                 call CocAction('doHover')
             endif
         endfunction
         " Highlight symbol under cursor on CursorHold
         autocmd CursorHold * silent call CocActionAsync('highlight')
          " Remap for rename current word
          nmap <leader>rn <Plug>(coc-rename)
          " Remap for format selected region
          xmap <leader>f <Plug>(coc-format-selected)
          nmap <leader>f <Plug>(coc-format-selected)
          xmap <leader>f  <Plug>(coc-format-selected)
          nmap <leader>f  <Plug>(coc-format-selected)
          " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
          nmap <silent> <TAB> <Plug>(coc-range-select)
          xmap <silent> <TAB> <Plug>(coc-range-select)
          " Use `:Format` to format current buffer
          command! -nargs=0 Format :call CocAction('format')
          " Use `:Fold` to fold current buffer
          command! -nargs=? Fold :call     CocAction('fold', <f-args>)
          " use `:OR` for organize import of current buffer
          command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
          " Add status line support, for integration with other plugin, checkout `:h coc-status`
          set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
          " Using CocList
          " Show all diagnostics
          nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
          " Manage extensions
          nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
          " Show commands
          nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
          " Find symbol of current document
          nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
          " Search workspace symbols
          nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
          " Do default action for next item.
          nnoremap <silent> <space>j  :<C-u>CocNext<CR>
          " Do default action for previous item.
          nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
          " Resume latest coc list
          nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
          " SetUp CocConfig command to open the configuration file"
          function! SetupCommandAbbrs(from, to)
             exec 'cnoreabbrev <expr> '.a:from
                   \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
                   \ .'? ("'.a:to.'") : ("'.a:from.'"))'
          endfunction
    """ End Coc configuration

    "Activate Nord Vim as the default color theme
    "colorscheme nord
    " Open NerdTree to the current directory when no arguments are specifies
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " Close NerdTree when the current file is closed
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""" End Plugins configuration


""" User configuration:
    filetype plugin on
    syntax on
    set number                  " Show row numbers
    set relativenumber          " Show relative row numbers
    set encoding=utf-8
    set shiftwidth=4            " Indents  will have a width of 4
    set tabstop=4               " Sets number fo columns for a TAB
    set smarttab
    set smartindent
    set autoindent
    set expandtab               " A tab equals 4 Spaces
    set mouse=a                 " Enable mouse
    set cursorline              " Highlight the current line.
    " Enable autocompletion:
    set wildmode=longest,list,full
    " Map Q key to execute filetext commands and get the result in return
    noremap Q !!sh<CR>
    " Spell-chek set to <leader>o, 'o' for 'orthography':
    map <leader>o :setlocal spell! spelllang=en_us<CR>
    " Set $ to visualize de end of the line
    set list
    " Splits open at the botton and right, which is non-retarded, unlinke vim defaults
    set splitbelow splitright
    " To allow vim to execute system functions
    set shell=sh
    " Automatically deletes all trailing whitespaces on save:
    autocmd BufWritePre * %s/\s\+$//e
    " Map <leader>nr <leader>r to disable or enable relative number
    map <leader>nr :set norelativenumber<CR>
    map <leader>r : set relativenumber<CR>
    " Remove automatic comments
    autocmd FileType * setlocal formatoptions-=cro
    " Map <leader>-n to open NerdTree
    map <C-n> : NERDTreeToggle<CR>
    " Map <leader>p and <leader>e to compile a markdown file to pdf and open the pdf file with evince.
    autocmd FileType md map <leader>p :!pandoc -s -o '%:r'.pdf '%' """ NOT WORKING
    autocmd FileType md map <leader>ev :!evince '%:r'.pdf """ NOT WORKING
""" End User configuration


""" Mapping key
    " Navigating with guides
    inoremap !<Enter> <Esc>/<++><Enter>"_c4l
    vnoremap !<Enter> <Esc>/<++><Enter>"_c4l
    map !<Enter> <Esc>/<++><Enter>"_c4l

    " For all files open open and close parenthesis, brackets...
    inoremap !( ()<++><Esc>4hi
    inoremap !{ {}<++><Esc>4hi
    inoremap ![ []<++><Esc>4hi
    inoremap !< <><++><Esc>4hi

    """ LATEX -  https://www.youtube.com/watch?v=cTBgtN-s2Zw&t=1s
        autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametile{}<Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
        autocmd FileType tex inoremap ,fi \begin{flitch}<Enter><Enter>\end{flithc}<Enter><Enter><++><Esc>3kA

    """ HTML
        autocmd FileType html inoremap ,p <p><++></p><Esc>0
        autocmd FileType html inoremap ,body <body><Enter><++><Enter></body><Esc>3k
        autocmd FileType html inoremap ,div <div><Enter><++><Enter></div><Esc>3k

    """ C
        autocmd FileType c inoremap !main int<Space>main()<Space>{<Enter><++><Enter>}<Esc>2k0f(a
        autocmd FileType c inoremap !fun <Space><++>(<++>)<Space>{<Enter><++><Enter>}<Esc>2k0i
        autocmd FileType c inoremap !if if<Space>()<Space>{<Enter><++><Enter>}<Esc>2k0f(a
""" End mapping key
