"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
"set background=dark

set cursorline                      " Highlight current line
set fileformats=unix,dos,mac        " Use correct eol format

set scrolloff=10                    " Improve handling and navigation of vim

set colorcolumn=72,80,90,120        " Add vertical guidelines

set listchars=tab:‣-,trail:·,extends:»,precedes:«

" hi CocSearch ctermfg=12 guifg=#18A3FF
" hi CocMenuSel ctermbg=109 guibg=#13354

" Add transparency to floating windows but selected item non transparent
set pumblend=15
hi PmenuSel blend=0
