"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set default syntax for various file types

set t_Co=256                        " Set number of available colours
" colorscheme antares
colorscheme harlequin

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

" Spell
hi SpellBad ctermbg=none cterm=underline
hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0

set fileformats=unix,dos,mac        " Use correct eol format

set scrolloff=10                    " Improve handling and navigation of vim

set colorcolumn=80,90,120           " Add vertical guidelines
hi ColorColumn cterm=NONE ctermbg=Black

set listchars=tab:‣-,eol:↵,trail:·,extends:»,precedes:«
