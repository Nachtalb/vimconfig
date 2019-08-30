"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ==== Install Plugins ====
" This is required for Vundle to work
Plugin 'VundleVim/Vundle.vim'
Plugin 'makerj/vim-pdf'

Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'neoclide/mycomment.vim'
" Plugin 'davidhalter/jedi-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'ap/vim-buftabline'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'skywind3000/asyncrun.vim'

execute pathogen#infect()

" ==== Ack / Ag ====
" Grep for word under cursor
nnoremap K :Ack! -tf "\b<C-R><C-W>\b"<CR>:cw<CR>

" Other settings
" let g:ackpreview = 1

" Use silver searcher (ag) if available (much faster than Ack)
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ -U\ --follow

    let g:ackprg='ag --vimgrep --smart-case -U --follow --ignore-dir testreports --ignore SOURCES.txt --ignore-dir var --ignore-dir .idea --ignore-dir var'
    if isdirectory('parts/omelette/')
        let plone_dir = trim(system('ls -1 -f | grep egg-info | cut -d. -f1'))
        let plone_dir = trim(system("dirname $(ls -1 -f | grep egg-info | sed 's/\\./\\//g')"))
        let g:ackprg=g:ackprg . ' --ignore-dir parts/omelette/' . plone_dir
    endif

    nnoremap <Leader>a :Ack! <C-r><C-w>
    nnoremap <Leader>A :Ack! --ignore-dir tests <C-r><C-w>
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
let g:ale_fix_on_save = 0
let g:ale_linter_aliases = {'vue': ['vue', 'javascript'],}
let g:ale_fixers = {
    \ 'python': ['autopep8', 'isort', 'yapf'],
    \ 'javascript': ['prettier', 'eslint'],
\ }
let g:ale_linters = {'python': ['flake8'], 'scss': ['scsslint'], 'css': ['scsslint'], 'scss.css': ['scsslint'],}

" Use Ale Fixer for these filetypes
au BufNewFile,BufRead *.py,*.js nmap <F8> <Plug>(ale_fix)

" ==== Fugitive ====
nnoremap <Leader>gs :Gstatus<cr>
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

" ==== VimWiki ====
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{
                      \ 'path': '~/wiki',
                      \ 'path_html': '~/wiki/html',
                      \ 'auto_export': 1,
                      \ 'auto_toc': 1,
                    \ },
                    \ {
                      \ 'path': '~/pub_wiki',
                      \ 'path_html': '~/pub_wiki/html',
                      \ 'auto_export': 1,
                      \ 'auto_toc': 1,
                    \ }]
" Auto convert wiki files to HTML
autocmd BufWritePost *.wiki silent VimwikiAll2HTML


" AsyncRun
let g:asyncrun_open = 20    " Auto open quickfix window with the given size

nnoremap <Leader>ar :AsyncRun! -raw=1
nnoremap <Leader>te :AsyncRun -raw=1 bin/test
nnoremap <Leader>tt :AsyncRun -raw=1 bin/test -t <cword><CR>
nnoremap <Leader>ab :AsyncRun -raw=1 bin/buildout<CR>
nnoremap <Leader>abi :AsyncRun -raw=1 bin/buildout install instance<CR>
nnoremap <Leader>abt :AsyncRun -raw=1 bin/buildout install test<CR>
nnoremap <Leader>ai :AsyncRun -raw=1 bin/i18n-build<CR>
nnoremap <Leader>af :AsyncRun -raw=1 bin/instance fg<CR>

" Add some of the shortcuts above as normal commands when pdb is exptected
nnoremap <Leader>cte :!bin/test
nnoremap <Leader>ctt :!bin/test -t <cword><CR>
nnoremap <Leader>caf :!bin/instance fg<CR>


" ==== End Plugin Section ====
" This is required for Vundle to work
call vundle#end()
filetype plugin indent on
