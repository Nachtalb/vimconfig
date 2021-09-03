"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Set default syntax for various file types
colorscheme badwolf
hi Normal guibg=black

" function! SetCursor(type)
"     let settings="'/mnt/c/Users/nicko/AppData/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe/LocalState/settings.json'"
"     silent execute "!cat " . settings . " | jq .profiles.list[1].cursorShape='\"" . a:type . "\"' | cat > " . settings
" endfunction
"
" au VimEnter * call SetCursor('filledBox')
" au VimLeave * call SetCursor('bar')

set cursorline                      " Highlight current line
" hi CursorLine gui=NONE  guibg=NONE gui=reverse
hi CursorLineNR gui=NONE guibg=red guifg=black cterm=BOLD

" Define how search results are highlighted
" hi Search gui=NONE guibg=Grey
" hi IncSearch gui=NONE guifg=DarkGrey guibg=LightRed

" Set color of matching parentheses
hi MatchParen guifg=black guibg=red

" Set color of error messages
" hi ErrorMsg guifg=255

" Spell
hi SpellBad guibg=NONE gui=underline
" hi statusline guibg=Cyan guifg=6 guifg=Black guibg=0

set fileformats=unix,dos,mac        " Use correct eol format

set scrolloff=10                    " Improve handling and navigation of vim

set colorcolumn=72,80,90,120           " Add vertical guidelines
hi ColorColumn gui=NONE guibg=Black

set listchars=tab:‣-,trail:·,extends:»,precedes:«


" ==== PLUGIN STYLES ===
hi CocFadeOut guibg=#555555 guifg=NONE
hi CocErrorHighlight guibg=#610f0a
let g:Hexokinase_highlighters = ['backgroundfull']
