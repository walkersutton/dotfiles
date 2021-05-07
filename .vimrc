syntax enable

" force 256 colors in terminal
set t_Co=256

" shorten timeout value - helps o and O with the added oo and OO mappings
set timeoutlen=200

colorscheme desert

set cursorline

hi CursorLine cterm=none ctermbg=8 ctermfg=white
hi CursorLineNr cterm=none ctermbg=8 ctermfg=none

" absolute line number
set nu

" show cursor (x,y) on status bar
set ruler

" cursor vertical padding
set so=7

" intuitive backspace mod
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case when searching
set ignorecase
set smartcase
" highlight search results
set hlsearch

set tabstop=4
set shiftwidth=4
set expandtab

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" something about line endings (?)
set ffs=unix,dos,mac

""""""""""""
" MAPPINGS "
""""""""""""
" toggle cursorline
:nnoremap H :set cursorline! <CR>
" insert newline & stay in visual mode
:nmap oo o<Esc>
:nmap OO O<Esc>

""""""""""""""""
" OCaml config "
""""""""""""""""
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
