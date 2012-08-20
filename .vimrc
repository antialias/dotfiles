" RedDot
" sensible default 
au BufRead,BufNewFile *.rdtp setfiletype php
" decode and re-encode freshly exported Red Dot templates
nmap \rd :e ++enc=ucs-2le<cr>:set fenc=latin1<cr>


set virtualedit=onemore
set pastetoggle=<F2>
syntax on
set autoindent
set number
set background=dark
cmap w!! %!sudo tee > /dev/null %
filetype plugin indent on
