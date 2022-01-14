" color
set background=dark
colorscheme hybrid
syntax on

" unset
set nobackup
set nocompatible
set nojoinspaces
set noswapfile
set nowrap
set nowrapscan

" set
set ambiwidth=double
set autoindent
set backspace=indent,eol,start
set diffopt=filler,iwhite,vertical
set display=uhex
set colorcolumn=100
set expandtab
set fileformat=unix
set fileformats=unix,dos
set fileencoding=utf-8
set fileencodings=utf-8,cp932
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>\ ,trail:-
set mouse=a
set nrformats=""
set number
set shiftwidth=2
set showtabline=2
set smartindent
set softtabstop=2
set statusline=%<%f\ [%{&readonly?'RO':'RW'}][%{&fenc!=''?&fenc:&enc}][%{&ff}]%y[%1(%M%)]%=%l/%L(%3P),%3c,\ %03b,0x%02B
set tabstop=2
set whichwrap=b,s,h,l,<,>,~,[,]

" visible zenkaku-space
highlight ZenkakuSpace cterm=NONE ctermfg=NONE ctermbg=darkgrey
match ZenkakuSpace /　/

" clear highlight
nnoremap <ESC><ESC> :nohlsearch<CR>

" cursor at center of vertical when move to next search keyword
nnoremap n nzz

" *.md is markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
" *.gradle is groovy
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
" *.rest is rst
autocmd BufNewFile,BufRead *.rest set filetype=rst
" *.go
autocmd BufNewFile,BufRead *.go set noexpandtab
