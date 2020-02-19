"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ==== Install Plugins ====
Plug 'junegunn/vim-plug'

Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ap/vim-buftabline'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-unimpaired'
" Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'skywind3000/asyncrun.vim'
Plug 'jez/vim-superman'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'dag/vim-fish'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/vim-lastplace'
Plug 'vim-scripts/xmledit'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-colorscheme-switcher'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jez/vim-superman'


" ==== COC ====
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

inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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

" ==== Emmet ====
let g:user_emmet_leader_key=','

" ==== Ack / Ag ====
" Other settings
" let g:ackpreview = 1

" Use silver searcher (ag) if available (much faster than Ack)
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ -U\ --follow

    let g:ackprg='ag --vimgrep --smart-case -U --follow --ignore-dir subinstallations --ignore-dir testreports --ignore SOURCES.txt --ignore-dir var --ignore-dir .idea --ignore-dir var --ignore-dir log'
    if isdirectory('parts/omelette/')
        let plone_dir = trim(system('ls -1 -f | grep egg-info | cut -d. -f1'))
        let plone_dir = trim(system("dirname $(ls -1 -f | grep egg-info | sed 's/\\./\\//g')"))
        let g:ackprg=g:ackprg . ' --ignore-dir parts/omelette/' . plone_dir
    endif

    nnoremap <Leader>a :Ack! '<C-r><C-w>'
    nnoremap <Leader>A :Ack! --ignore-dir tests '<C-r><C-w>'
endif

" ==== NERDTree ==== "
" Open close with CTRL-E
inoremap <C-e> <ESC>:NERDTreeToggle<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
" Find file in NERDTree with CTRL-F
inoremap <C-f> <ESC>:NERDTreeFind<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Various settins
let NERDTreeWinSize=35
let NERDTreeWinPos = "left"
let NERDTreeRespectWildIgnore = 0
let NERDTreeIgnore = ['\.pyc', '\.pyo', '__pycache__', '\.idea', '\.git', '\.so', '\.swp', 'tmp', '\.DS_Store']
let NERDTreeAutoCenter = 1
let NERDTreeSortHiddenFirst = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1

" ==== Ale ====
" let g:ale_fix_on_save = 0
" let g:ale_linter_aliases = {'vue': ['vue', 'javascript'],}
" let g:ale_fixers = {
"     \ 'python': ['autopep8', 'isort', 'yapf'],
"     \ 'javascript': ['prettier', 'eslint'],
" \ }
" " let g:ale_linters = {'python': ['flake8'], 'scss': ['scsslint'], 'css': ['scsslint'], 'scss.css': ['scsslint'],}
" let g:ale_linters = {'python': ['pylama'], 'scss': ['scsslint'], 'css': ['scsslint']}
"
" " Use Ale Fixer for these filetypes
" au BufNewFile,BufRead *.py,*.js nmap <F8> <Plug>(ale_fix)

" ==== Fugitive ====
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>go :Git open<cr><cr>
nnoremap <Leader>gpl :Git pull -r<cr>
nnoremap <Leader>gpf :Gpush -f
nnoremap <Leader>gpp :Gpush
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gcc :Gcommit<cr>
nnoremap <Leader>gca :Git commit --amend --no-edit
nnoremap <Leader>gco :Git checkout
nnoremap <Leader>gcb :Git checkout -b ne/
nnoremap <Leader>gl1 :!GIT_PAGER=less git log --graph --abbrev-commit --decorate --format='\%C(bold blue)\%h\%C(reset) - \%C(bold green)(\%ai)\%C(reset) \%C(white)\%s\%C(reset) \%C(dim white)- \%an\%C(reset)\%C(bold yellow)\%d\%C(reset)' --color=always --all<CR>
nnoremap <Leader>gl1 :!GIT_PAGER=less git log --graph --abbrev-commit --decorate --format='\%C(bold blue)\%h\%C(reset) - \%C(bold green)(\%ai)\%C(reset) \%C(white)\%s\%C(reset) \%C(dim white)- \%an\%C(reset)\%C(bold yellow)\%d\%C(reset)' --color=always<CR>

"
" ==== GitGutter ====
nnoremap <F3> :GitGutterPrevHunk<CR>
inoremap <F3> <C-o>:GitGutterPrevHunk<CR>
nnoremap <F4> :GitGutterNextHunk<CR>
inoremap <F4> <C-o>:GitGutterNextHunk<CR>

" ==== buf tabline ====
set hidden
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
noremap <C-q> :bdelete<CR>

" ==== FZF ====
" Use CTRL-P to launch FZF
execute 'map <C-P> :FZF --inline-info --history=' . expand('~') . '/.fzf_history<CR>'

" AsyncRun
let g:asyncrun_open = 20    " Auto open quickfix window with the given size

nnoremap <Leader>ar :AsyncRun! -raw=1
nnoremap <Leader>ta :AsyncRun -raw=1 bin/test
nnoremap <Leader>tt :AsyncRun -raw=1 bin/test -t <cword><CR>
nnoremap <Leader>apbo :AsyncRun -raw=1 bin/buildout<CR>
nnoremap <Leader>apbi :AsyncRun -raw=1 bin/buildout install instance<CR>
nnoremap <Leader>apbt :AsyncRun -raw=1 bin/buildout install test<CR>
nnoremap <Leader>aib :AsyncRun -raw=1 bin/i18n-build<CR>
nnoremap <Leader>afg :AsyncRun -raw=1 bin/instance fg<CR>

" Add some of the shortcuts above as normal commands when pdb is exptected
nnoremap <Leader>cte :!bin/test
nnoremap <Leader>ctt :!bin/test -t <cword><CR>
nnoremap <Leader>caf :!bin/instance fg<CR>

" ==== End Plugin Section ====
" This is required for Vim-Plug to work
" call vundle#end()
call plug#end()
filetype plugin indent on
