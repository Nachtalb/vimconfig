""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                    " be iMproved, required
filetype off                        " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')

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
set viminfo+=n.viminfo              " Save viminfo dir specific

set hidden

set exrc                            " Enable project specific .vimrc settings


" Correct neovim python interpreter

let g:python3_host_prog="~/.pyenv/versions/nvim/bin/python"
let g:python_host_prog="~/.pyenv/versions/nvim2/bin/python"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set lazyredraw                      " Improve vim's drawing mechanism

set number                          " Add line numbers
set mouse=                          " Disable mouse

set incsearch                       " Higlight search results while typing
set hlsearch                        " Higlight all search results of previous search
set ignorecase                      " Ignore case while searching
set smartcase                       " Override ignorecase if uppercase chars are typpedd

set splitbelow                      " Open new vim windows below instead of above
set splitright                      " Open new vim windows on the right instead of left

" Turn of search higlights of previous search
nnoremap <leader><space> :nohlsearch<CR>

set showcmd                         " Show current command being typed

set wildmenu                        " Show available completions when hitting Tab

" Ignore various files
set wildignore=*~,*.pyc,*.pyo,*/.hg/*,*/.svn/*,*/.DS_Store,*/tmp/*,*.so,*.swp,*.documents,.idea,var,log,.git,node_modules,.coffee

set backspace=eol,start,indent      " Make backspace work as it should

set encoding=utf-8                  " Set correct encoding

set list                            " Show spcial characters like trailing whitespaces / tabs and eol

set nofoldenable                    " Disable code folding

set nowrap                          " Do not wrap lines

set nospell                           " Enable spellcheck
set spelllang=en                    " Set spellcheck language to english


function! GitBranch()
    if filereadable('.git/HEAD')
        return trim(substitute(readfile('.git/HEAD', '', 1)[0], 'ref: refs\/heads\/', '', 'g'))
    endif
    return ''
endfunction

set laststatus=2
" set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}=%=%{coc#status()}%{get(b:,'coc_current_function','')}\ %l:%c
" set statusline=%{GitBranch()}\ %f%m%r%<\ %{&fileencoding?&fileencoding:&encoding}\ [%{&ff}]\ %y\ %=%{coc#status()}%{get(b:,'coc_current_function','')}\ %l/%L:%v

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on                           " Enable syntax higlighting

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

nnoremap <leader>q :bp \| sp \| bn \| bd<CR>


fun! ToggleStatusline()
    if &laststatus == 2
        set laststatus=0
        set showcmd
    else
        set laststatus=2
        set noshowcmd
    endif
endfun

map <leader>l :call ToggleStatusline()<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

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

" Alt-Left / Alt-Right OR CTRL-Left / CTRL-Right
inoremap <ESC>[1;5C <C-o>w
inoremap <ESC>[1;5D <C-o>b
nnoremap <ESC>[1;5C w
nnoremap <ESC>[1;5D b
cnoremap <ESC>[1;5C <C-Right>
cnoremap <ESC>[1;5D <C-Left>

" Duplicate lines
vnoremap <C-d> y`>p

" Select All
nnoremap <C-a> ggVG

" Fix indentation
" nnoremap <F8> gg=G''
" vnoremap <F8> =

" Sort selected area
vnoremap <F5> :sort<CR>

" Show buffer list
nnoremap <C-x> :Buffers<CR>
inoremap <C-x> <C-o>:Buffers<CR>

" Toggle Pastemode
set pastetoggle=<F2>

" Copy path to clipboard
nnoremap cp :let @* = expand('%')<CR>
nnoremap cpp :let @* = expand('%:p')<CR>


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
cnoremap <C-a>        <Home>
cnoremap <C-e>        <End>
cnoremap <C-k>        <C-U>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" execute "set <M-a>=\ea"
" execute "set <M-x>=\ex"
nnoremap <M-a> <C-a>
nnoremap <M-x> <C-x>
