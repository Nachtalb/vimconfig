"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" === Install Plugins ===

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-buftabline'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-unimpaired'
Plug 'skywind3000/asyncrun.vim'
Plug 'jez/vim-superman'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'dag/vim-fish'
Plug 'vim-scripts/xmledit'
Plug 'xolox/vim-misc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jez/vim-superman'
Plug 'godlygeek/tabular'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/matchit'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'majutsushi/tagbar'
Plug 'soramugi/auto-ctags.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-obsession'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'chrisbra/unicode.vim'
Plug 'isundil/vim-irssi-syntax'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
Plug 'moll/vim-bbye'
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'rcarriga/nvim-notify'
Plug 'folke/which-key.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dstein64/nvim-scrollview'
Plug 'ryanoasis/vim-devicons'
Plug 'dstein64/vim-startuptime'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'previm/previm'

" === Previm ===
let g:previm_open_cmd = "xdg-open"

" === Enfocado ===
let g:enfocado_plugins = [
  \ 'coc',
  \ 'notify',
  \ 'plug',
  \ 'telescope',
  \ 'which-key',
\ ]

" Transparent background
augroup enfocado_customization
  autocmd!
    autocmd ColorScheme enfocado highlight Normal ctermbg=NONE guibg=NONE
    autocmd ColorScheme enfocado highlight NormalNC ctermbg=NONE guibg=NONE
augroup END

" === Telescope ===

nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fa <cmd>Telescope find_files no_ignore=true<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>

" === Undo Tree ===
nnoremap <F5> :UndotreeToggle<CR>

nmap ga <Plug>(UnicodeGA)

" === TagbarToggle ===
nmap <F7> :TagbarJumpPrev<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarJumpNext<CR>

" === LASTPLACE ===
" Intelligently reopen files
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

" === Commenter ====
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"=== COC ===

" coc-highlight:
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:coc_global_extensions = [
    \'coc-browser',
    \'coc-cmake',
    \'coc-css',
    \'coc-cssmodules',
    \'coc-eslint',
    \'coc-git',
    \'coc-html',
    \'coc-json',
    \'coc-markdownlint',
    \'coc-pyright',
    \'coc-sh',
    \'coc-svg',
    \'coc-translator',
    \'coc-tsserver',
    \'coc-xml',
    \'coc-yaml',
    \'coc-yank',
    \'coc-clangd',
    \'coc-markdown-preview-enhanced',
    \'coc-vimlsp',
    \'coc-elixir',
    \'coc-rust-analyzer',
    \'coc-marketplace',
\]

" \'coc-spell-checker',
" coc-yank
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

inoremap <nowait><expr> <C-l> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-h> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" coc-git
" navigate chunks of current buffer
nnoremap <silent><nowait>[g <Plug>(coc-git-prevchunk)
nnoremap <silent><nowait>]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
nmap go :CocCommand git.browserOpen<cr>
nmap <Leader>gu :CocCommand git.chunkUndo<cr>

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
inoremap <silent><expr> <c-@> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <C-l> :call <SID>show_documentation()<CR>
inoremap <silent> <C-l> :call <SID>show_documentation()<CR>

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
vmap <leader>a  <Plug>(coc-codeaction-selected)
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
function! Format()
    call CocAction('format')
    if (&ft=='python')
        call CocAction('runCommand', 'editor.action.organizeImport')
    endif
endfunction

command! -nargs=0 Format call Format()
nnoremap <leader>f :Format<cr>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <leader>or :OR<cr>
autocmd BufWritePre *.py :silent call CocAction('runCommand', 'editor.action.organizeImport')

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

" === Emmet ===
let g:user_emmet_leader_key=','

" === Ack / Ag ===
" Other settings
" let g:ackpreview = 1

" Use silver searcher (ag) if available (much faster than Ack)
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ -U\ --follow

    let g:ackprg='ag --silent --vimgrep --smart-case -U --follow --ignore-dir public --ignore-dir testreports --ignore SOURCES.txt --ignore-dir var --ignore-dir .idea --ignore-dir var --ignore-dir log --ignore-dir node_modules --ignore-dir parts/solr-download --ignore-dir parts/solr-instance --ignore "*.min.js" --ignore "*compiled.js" --ignore "*.map"'
    if isdirectory('parts/omelette/')
        let plone_dir = trim(system('ls -1 -f | grep egg-info | cut -d. -f1'))
        let plone_dir = trim(system("dirname $(ls -1 -f | grep egg-info | sed 's/\\./\\//g')"))
        let g:ackprg=g:ackprg . ' --ignore-dir src --ignore-dir parts/omelette/' . plone_dir
    endif

    nnoremap <Leader>aa :Ack! '<C-r><C-w>'
    nnoremap <Leader>AA :Ack! --ignore-dir tests '<C-r><C-w>'
endif

" === Nvim-Tree === "
" Open close with CTRL-E
inoremap <C-e> <ESC>:NvimTreeToggle<CR>
nnoremap <C-e> :NvimTreeToggle<CR>
" Find file in NvimTree with CTRL-F
inoremap <C-f> <ESC>:NvimTreeFindFileToggle<CR>
nnoremap <C-f> :NvimTreeFindFileToggle<CR>

" === Fugitive ===
nnoremap <Leader>gs :Git<cr>
nnoremap <Leader>gpl :Git pull -r<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gpf :Git push -f
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gcc :Gcommit<cr>
nnoremap <Leader>gca :Git commit --amend --no-edit
nnoremap <Leader>gco :Git checkout
nnoremap <Leader>gcb :Git checkout -b ne/
nnoremap <Leader>gl1 :!GIT_PAGER=less git log --graph --abbrev-commit --decorate --format='\%C(bold blue)\%h\%C(reset) - \%C(bold green)(\%ai)\%C(reset) \%C(white)\%s\%C(reset) \%C(dim white)- \%an\%C(reset)\%C(bold yellow)\%d\%C(reset)' --color=always --all<CR>
nnoremap <Leader>gl1 :!GIT_PAGER=less git log --graph --abbrev-commit --decorate --format='\%C(bold blue)\%h\%C(reset) - \%C(bold green)(\%ai)\%C(reset) \%C(white)\%s\%C(reset) \%C(dim white)- \%an\%C(reset)\%C(bold yellow)\%d\%C(reset)' --color=always<CR>

" === Buffer Tabline ===
set hidden
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
noremap <C-q> :bdelete<CR>
noremap <Leader>q :Bdelete<CR>

" === AsyncRun ===
let g:asyncrun_open = 20    " Auto open quickfix window with the given size
nnoremap <Leader>ar :AsyncRun! -raw=1

" === End Plugin Section ===
call plug#end()
filetype plugin indent on

lua << END
require('lualine').setup { options = { theme = 'enfocado' } }

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = "preview_scrolling_down",
                ['<C-k>'] = "preview_scrolling_up",
            },
            n = {
                ['<C-j>'] = "preview_scrolling_down",
                ['<C-k>'] = "preview_scrolling_up",
            }
        }
    }
}

require("notify").setup({
    background_colour = "#000000",
    stages = "slide",
})
vim.notify = require("notify")

require("which-key").setup()

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    respect_buf_cwd = true,
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "<C-e>", action = "" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    },
})
END
