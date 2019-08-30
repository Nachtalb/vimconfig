"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                    " be iMproved, required
filetype off                        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let mapleader = ","                 " Set leader to ,

" Write file as sudo with upper case w
command W w !sudo tee % > /dev/null

set autoread                        " Auto read external changes

" Set internal shell bash if fish was detected
if &shell =~# 'fish$'
    :set shell=bash
endif

set clipboard=unnamed               " Use system clipboard

set viminfo^=%                      " Remember open buffers


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set lazyredraw                      " Improve vim's drawing mechanism

set number                          " Add line numbers
set mouse=                          " Disable mouse

set incsearch                       " Higlight search results while typing
set hlsearch                        " Higlight all search results of previous search
set ignorecase                      " Ignore case while searching
set smartcase                       " Override ignorecase if uppercase chars are typped

" Turn of search higlights of previous search
nnoremap <leader><space> :nohlsearch<CR>

set showcmd                         " Show current command being typed

set wildmenu                        " Show available completions when hitting Tab

" Ignore various files
set wildignore=*~,*.pyc,*.pyo,*/.hg/*,*/.svn/*,*/.DS_Store,*/tmp/*,*.so,*.swp,*.documents,.idea,var,log,.git,node_modules,.coffee

set backspace=eol,start,indent      " Make backspace work as it should

set encoding=utf-8                  " Set correct encoding

set list                            " Show spcial characters like trailing whitespaces / tabs and eol
set listchars=tab:‣\ ,eol:↵,trail:·,extends:»,precedes:«

set nofoldenable                    " Disable code folding

set nowrap                          " Do not wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on                           " Enable syntax higlighting

" Set default syntax for various file types
autocmd BufNewFile,BufRead *.zcml set syntax=xml
autocmd BufNewFile,BufRead *.fish set syntax=sh

set t_Co=256                        " Set number of available colours
colorscheme PaperColor
let g:airline_theme='papercolor'    " Use airline theme matching colorscheme

set cursorline                      " Highlight current line
hi CursorLine cterm=NONE  ctermbg=Black
hi CursorLineNR cterm=NONE ctermbg=red ctermfg=Yellow

" Define how search results are higghlighted
hi Search cterm=NONE ctermbg=Grey
hi IncSearch cterm=NONE ctermfg=DarkGrey ctermbg=LightRed

" Set color of matching parentheses
hi MatchParen ctermfg=255 ctermbg=red

" Set color of error messages
hi ErrorMsg ctermfg=255

set fileformats=unix,dos,mac        " Use correct eol format

set scrolloff=10                    " Improve handling and navigation of vim

set colorcolumn=80,90,120           " Add vertical guidelines
hi ColorColumn cterm=NONE ctermbg=Black


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup                        " Turn off backups
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python_recommended_style = 0  " Disable tab with defined by the python plugin

set magic                           " Enable regex

set tabstop=4                       " Use correct amount of spaces for tab
set softtabstop=4
set shiftwidth=4
set expandtab

function TrimWhiteSpace()
    " Delete trailing whitespaces
    %s/\s*$//
    ''
endfunction

" Autoremove trailing whitespaces on file save and other events
autocmd FileWritePre,FileAppendPre,FileAppendPre,BufWritePre * call TrimWhiteSpace()

set complete+=k                     " Scan the files given with the 'dictionary' option
set completeopt-=preview            " Remove preview split on completion


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! ToggleCopyMode()
    " Disable all extra characters etc. to get a clean text
    if &cc == ''
        GitGutterEnable
        ALEDisable
        set colorcolumn=80,90,120
        set number
        set list
    else
        GitGutterDisable
        ALEEnable
        set colorcolumn=
        set nolist
        set nonumber
    endif
endfun

" Toggle paste mode on and off
map <leader>cm :call ToggleCopyMode()<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Write buffer if updated on CTRL-s
inoremap <C-s> <C-o>:w<CR>
noremap <C-s> :w<CR>

" Use CTRL-j and CTRL-k to move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Prepaer for replace word under cursor
noremap <leader>S :%s/\<<C-r><C-w>\>//g<Left><Left>
" Prepare for to search for word under cursor
noremap <leader>s /<C-r><C-w><CR>

" Alt-Left / Alt-Right
inoremap <ESC>[1;5C <C-o>w
inoremap <ESC>[1;5D <C-o>b
nnoremap <ESC>[1;5C w
nnoremap <ESC>[1;5D b

" Duplicate lines
vnoremap <C-d> y`>p

" Select All
nnoremap <C-a> ggVG

" Fix indentation
nnoremap <F8> gg=G''
vnoremap <F8> =

" Path to reference
nnoremap <F6> :.s/\//\./g \| nohl<CR>
inoremap <F6> <C-o>:.s/\//\./g \| nohl<CR>

" Toggle Pastemode
set pastetoggle=<F2>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash like keys for the command line
cnoremap <C-A>        <Home>
cnoremap <C-E>        <End>
cnoremap <C-K>        <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
