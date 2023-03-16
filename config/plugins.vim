"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cSpell: disable

" === Install Plugins ===
Plug 'dstein64/vim-startuptime'
" Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
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
Plug 'kyazdani42/nvim-tree.lua'
Plug 'previm/previm'
Plug 'hashivim/vim-terraform'
Plug 'mitsuhiko/vim-jinja'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'nikvdp/neomux'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mfussenegger/nvim-dap-python'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'jbyuki/one-small-step-for-vimkind'
Plug 'rcarriga/nvim-dap-ui'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'williamboman/mason.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'

" === Previm ===
let g:previm_open_cmd = "xdg-open"

" === Markdown Preview ===
let g:mkdp_auto_close = 0

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

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'both'

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
    \'coc-snippets',
    \'coc-spell-checker',
    \'coc-emoji',
    \'coc-webview',
    \'@yaegassy/coc-ansible',
    \'coc-diagnostic',
    \'coc-markdownlint',
    \'coc-prettier',
    \'coc-lua',
\]
" \'coc-spell-checker',

" Quickly view a list of all coc.nvim commands
nnoremap <silent> <C-p> :<C-u>CocCommand<CR>

let g:coc_filetype_map = {
    \'yaml.ansible': 'ansible',
\}

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

"" COC Complation
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]d <Plug>(coc-diagnostic-next-error)
nmap <silent> [s <Plug>(coc-diagnostic-prev)
nmap <silent> ]s <Plug>(coc-diagnostic-next)

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

" Run the Code Lens action on the current line
nnoremap <leader>cl  <Plug>(coc-codelens-action)

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nnoremap <silent> <C-s> <Plug>(coc-range-select)
xnoremap <silent> <C-s> <Plug>(coc-range-select)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
" Eg. V (select mdoe) then af to select the whole function under the cursor
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

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

" Use `:Format` to format current buffer
function! Format()
    call CocAction('format')
    if (&ft=='python')
        call CocAction('runCommand', 'python.sortImports')
    else
        call CocAction('runCommand', 'editor.action.organizeImport')
    endif
endfunction

command! -nargs=0 Format call Format()
nnoremap <leader>f :Format<cr>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" nnoremap <leader>or :OR<cr>
" autocmd BufWritePre *.py :silent call CocAction('runCommand', 'editor.action.organizeImport')

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
" if executable('ag')
"     " Use ag over grep
"     set grepprg=ag\ --nogroup\ --nocolor\ -U\ --follow
"
"     let g:ackprg='ag --silent --vimgrep --smart-case -U --follow --ignore-dir public --ignore-dir testreports --ignore SOURCES.txt --ignore-dir var --ignore-dir .idea --ignore-dir var --ignore-dir log --ignore-dir node_modules --ignore-dir parts/solr-download --ignore-dir parts/solr-instance --ignore "*.min.js" --ignore "*compiled.js" --ignore "*.map"'
"
"     nnoremap <Leader>aa :Ack! '<C-r><C-w>'
"     nnoremap <Leader>AA :Ack! --ignore-dir tests '<C-r><C-w>'
" endif

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
nnoremap <Leader>gpu :Git push<cr>
nnoremap <Leader>gpf :Git push -f
nnoremap <Leader>gd  :Gdiff<cr>
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
noremap <Leader>q :bdelete<CR>
noremap <C-q> :Bdelete<CR>

" === AsyncRun ===
let g:asyncrun_open = 20    " Auto open quickfix window with the given size
nnoremap <Leader>ar :AsyncRun! -raw=1

if $NACHTALB_DOTFILES != ""
  let g:clipboard = {
        \    'name': 'ccopy',
        \    'copy': {
        \       '+': 'ccopy',
        \       '*': 'ccopy',
        \     },
        \    'paste': {
        \       '+': 'cpaste',
        \       '*': 'cpaste',
        \    },
        \    'cache_enabled': 0,
        \ }
endif

" === End Plugin Section ===
call plug#end()
filetype plugin indent on

lua << END
require('mason').setup()
require('config.dap').setup()

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

require("telescope").load_extension("ui-select")

require("notify").setup({
    background_colour = "#000000",
    stages = "slide",
})
vim.notify = require("notify")

require("which-key").setup()

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    -- START exapnd to file in tree
    prefer_startup_root = true,
    update_focused_file = {
        enable = true,
        ignore_list = {},
        update_root = true,
    },
    -- END
    auto_reload_on_write = true,
    hijack_unnamed_buffer_when_opening = true,
    modified = {
        enable = true,
    },
    select_prompts = true,
    view = {
        adaptive_size = true,
        centralize_selection = true,
        width = {
            min = 40,
        },
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "<C-e>", action = "" },
            },
        },
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "all",
        highlight_modified = "all",
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    live_filter = {
        always_show_folders = false,
    },
    notify = {
        threshold = vim.log.levels.WARNING
    }
})

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    formatting = {
      format = require('lspkind').cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      })
    }
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
END
