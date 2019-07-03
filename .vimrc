set virtualedit=block
set clipboard=unnamed
set foldmethod=syntax
set nocompatible              " be iMproved, required
filetype off                  " required

set autoread
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'w0rp/ale'
Plugin 'tpope/vim-unimpaired'
Plugin 'ciaranm/detectindent'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'othree/yajs.vim'
Plugin 'vim-scripts/SyntaxComplete'
Plugin 'sgur/vim-editorconfig'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set cursorline
hi cursorline cterm=none
hi cursorlinenr ctermfg=red

autocmd FileType typescript :set makeprg=tsx
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
set t_Co=256
syntax on
set background=dark
cmap w!! %!sudo tee > /dev/null %
set t_Co=256
colorscheme desert

set modeline
set autoindent
set expandtab
set wildmode=longest,list
"set wildignore+=*/build/*,*.so,*.swp,*.zip     " Linux/MacOSX

"set wildignore+=build/*

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

let python_highlight_all=1
let python_slow_sync=1
autocmd BufReadPost * :DetectIndent

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'coverage\|build-client\|build\|node_modules\|DS_Store\|git'
cabbr <expr> %% expand('%:p:h')
autocmd VimEnter * DetectIndent
set ignorecase
set smartcase


if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
    	    \	if &omnifunc == "" |
    	    \		setlocal omnifunc=syntaxcomplete#Complete |
    	    \	endif
endif

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'vue': ['eslint'],
\    'scss': ['prettier']
\}
let g:ale_fix_on_save = 1

