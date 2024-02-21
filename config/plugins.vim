"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cSpell: disable

" === Install Plugins ===
Plug 'dstein64/vim-startuptime'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
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
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'majutsushi/tagbar'
Plug 'soramugi/auto-ctags.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-obsession'
Plug 'wookayin/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'chrisbra/unicode.vim'
Plug 'isundil/vim-irssi-syntax'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
Plug 'moll/vim-bbye'
" Plug 'rcarriga/nvim-notify'
Plug 'folke/which-key.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dstein64/nvim-scrollview'
Plug 'ryanoasis/vim-devicons'
Plug 'hashivim/vim-terraform'
Plug 'mitsuhiko/vim-jinja'
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
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-python'
Plug 'nvim-neotest/neotest-plenary'
Plug 'nvim-neotest/neotest-vim-test'
Plug 'andymass/vim-matchup'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'hardhackerlabs/theme-vim', { 'as': 'hardhacker' }
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'echasnovski/mini.indentscope'
Plug 'folke/noice.nvim'
Plug 's1n7ax/nvim-window-picker'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'vimpostor/vim-tpipeline'
Plug 'github/copilot.vim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

" === TS Context ===
command! TSContextJump lua require("treesitter-context").go_to_context()
nnoremap [c :TSContextJump<CR>

" === Neotest ===
command! NeotestSummary lua require("neotest").summary.toggle()
command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%"))
command! Neotest lua require("neotest").run.run(vim.fn.getcwd())
command! NeotestNearest lua require("neotest").run.run()
command! NeotestDebug lua require("neotest").run.run({ strategy = "dap" })
command! NeotestAttach lua require("neotest").run.attach()

nnoremap <leader>tt :NeotestNearest<CR>
nnoremap <leader>tf :NeotestFile<CR>
nnoremap <leader>ta :Neotest<CR>
nnoremap <leader>ts :NeotestSummary<cr>

nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>

" === Previm ===
let g:previm_open_cmd = "xdg-open"

" === Telescope ===

nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fa <cmd>Telescope find_files no_ignore=true<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>
noremap <leader>s /<C-r><C-w><CR>

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
    \'coc-lua',
    \'coc-prettier',
    \'coc-toml',
\]
" \'coc-spell-checker',
" \'coc-clangd',

" Quickly view a list of all coc.nvim commands
nnoremap <silent> <C-p> :<C-u>CocCommand<CR>

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-n>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-p>'


let g:coc_filetype_map = {
    \'yaml.ansible': 'ansible',
    \'jinja2': 'htmldjango',
    \'j2': 'htmldjango',
\}

" coc-yank
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

" COC Complation
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
" Use K to show documentation in preview window.

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> <C-l> :call <SID>show_documentation()<CR>
inoremap <silent> <C-l> <ESC>:call <SID>show_documentation()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : ":m .+1\<CR>"
nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : ":m .-2\<CR>"
inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<C-o>:m .+1\<CR>"
inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<C-o>:m .-2\<CR>"

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
    try
      call CocAction('format')
    catch
      echohl Error
      echo '"' . expand('%') . '" could not be formatted'
      echohl None
    endtry
    if (&ft=='python')
        call CocAction('runCommand', 'python.sortImports')
    else
        call CocAction('runCommand', 'editor.action.organizeImport')
    endif
endfunction

command! -nargs=0 Format call Format()
nnoremap <leader>f :Format<cr>
" autocmd BufWritePre *.py :Format

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

" === NoeTree === "
" Open close with CTRL-E
inoremap <C-e> <ESC>:Neotree focus<CR>
nnoremap <C-e> :Neotree focus<CR>
" Find file in NvimTree with CTRL-F
inoremap <C-f> <ESC>:Neotree focus reveal_force_cwd<CR>
nnoremap <C-f> :Neotree focus reveal_force_cwd<CR>

" Navigate to the git root of the current file
:nmap <leader>gr :cd %:p:h <CR> \| :cd `git rev-parse --show-toplevel`<CR>

" === GIT ===
" navigate chunks of current buffer
nnoremap <silent><nowait>[g <Plug>(coc-git-prevchunk)
nnoremap <silent><nowait>]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
nmap go :CocCommand git.browserOpen<cr>
nmap <Leader>gu :CocCommand git.chunkUndo<cr>

nnoremap <Leader>gs :Git<cr>
nnoremap <Leader>gpl :Git pull -r<cr>
nnoremap <Leader>gpu :Git push<cr>
nnoremap <Leader>gpf :Git push --force-with-lease<cr>
nnoremap <Leader>gd  :Gdiff<cr>
nnoremap <Leader>gcc :Gcommit<cr>
nnoremap <Leader>gca :Git commit --amend --no-edit
nnoremap <Leader>gco :Git checkout
nnoremap <Leader>gcb :Git checkout -b ne/
nnoremap <Leader>gl :Telescope git_commits<CR>
nnoremap <Leader>gb :Telescope git_branches<CR>

" === Telescope ===
nnoremap <Leader>? :Telescope keymaps<CR>
nnoremap <Leader>p :Telescope registers<CR>

" === Buffer Tabline ===
set hidden
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
noremap <Leader>q :bdelete<CR>
noremap <C-q> :Bdelete<CR>

" === AsyncRun ===
let g:asyncrun_open = 20    " Auto open quickfix window with the given size
nnoremap <Leader>ar :AsyncRun! -raw=1

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

" === End Plugin Section ===
call plug#end()
filetype plugin indent on

lua << END
  require('mason').setup()
  require('config.dap').setup()

  -- HardHacker theme colors
  local colors = {
    blue   = '#b1baf4',
    cyan   = '#b3f4f3',
    black  = '#1c1924', -- 30% darker than HardHacker "Background"
    white  = '#eee9fc',
    red    = '#e965a5',
    violet = '#e192ef',
    comment   = '#3f3951',
  }

  local hardhacker_theme = {
    normal = {
      a = { fg = colors.black, bg = colors.violet },
      b = { fg = colors.white, bg = colors.comment },
      c = { fg = colors.white, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
      a = { fg = colors.white, bg = colors.black },
      b = { fg = colors.white, bg = colors.black },
      c = { fg = colors.black, bg = colors.black },
    },
  }

  require('mini.indentscope').setup {
    draw = {
      delay = 0,
      animation = require('mini.indentscope').gen_animation.none()
    },
    symbol = "▏",
    options = { try_as_border = false },
  }

  require('lualine').setup {
    options = {
      theme = hardhacker_theme,
      component_separators = '|',
      section_separators = { left = '', right = '' },
      icons_enabled = true,
    },
  }

  require("bufferline").setup {
    options = {
      separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
      indicator = {
        -- icon = " ",
        -- style = 'icon',
        style = "icon",
      },
      close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      diagnostics_indicator = function(count, _, _, _)
        if count > 9 then
          return "9+"
        end
        return tostring(count)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "EXPLORER",
          text_align = "center",
          -- separator = true,
        },
      },
      hover = {
        enabled = true,
        delay = 0,
        reveal = { "close" },
      },
    }
  }

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
  require("telescope").load_extension("live_grep_args")

  local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
  vim.keymap.set("n", "<leader>fs", live_grep_args_shortcuts.grep_word_under_cursor)

  -- require("notify").setup({
  --     background_colour = "#000000",
  --     stages = "slide",
  --     render = "wrapped-compact",
  --     max_width = 50,
  -- })
  -- vim.notify = require("notify")

  require("which-key").setup()

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    formatting = {
      format = require('lspkind').cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      })
    },
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

  require("neotest").setup({
    adapters = {
      require("neotest-python")({
        dap = { justMyCode = false },
      }),
      require("neotest-plenary"),
      require("neotest-vim-test")({
        ignore_file_types = { "python", "vim", "lua" },
      }),
    },
  })

  require("neo-tree").setup {
    close_if_last_window = true,
    document_symbols = {
      kinds = {
        File = { icon = "󰈙", hl = "Tag" },
        Namespace = { icon = "󰌗", hl = "Include" },
        Package = { icon = "󰏖", hl = "Label" },
        Class = { icon = "󰌗", hl = "Include" },
        Property = { icon = "󰆧", hl = "@property" },
        Enum = { icon = "󰒻", hl = "@number" },
        Function = { icon = "󰊕", hl = "Function" },
        String = { icon = "󰀬", hl = "String" },
        Number = { icon = "󰎠", hl = "Number" },
        Array = { icon = "󰅪", hl = "Type" },
        Object = { icon = "󰅩", hl = "Type" },
        Key = { icon = "󰌋", hl = "" },
        Struct = { icon = "󰌗", hl = "Type" },
        Operator = { icon = "󰆕", hl = "Operator" },
        TypeParameter = { icon = "󰊄", hl = "Type" },
        StaticMethod = { icon = '󰠄 ', hl = 'Function' },
      }
    },
    window = {
      width = 30,
      mappings = {
        ["<S-Tab>"] = "prev_source",
        ["<Tab>"] = "next_source",
        ["<C-f>"] = "close_window",
        ["<C-e>"] = "close_window",
      },
    },
    source_selector = {
      winbar = true,
      content_layout = "center",
      tabs_layout = "equal",
      show_separator_on_edge = true,
      sources = {
        { source = "filesystem", display_name = "󰉓 Files" },
        { source = "buffers", display_name = "󰈙 Buffer" },
        { source = "git_status", display_name = " Git" },
        { source = "diagnostics", display_name = "󰒡 Diagnostics" },
      }
    },
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        -- expander config, needed for nesting files
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        folder_empty_open = "",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = " ",
      },
      modified = { symbol = "[+]" },
      git_status = {
        symbols = {
          added = "",
          modified = "",
          removed = "",
          renamed = "➜",
          untracked = "",
          ignored = "",
          unstaged = "U",
          staged = "",
          conflict = "",
        },
      },
      diagnostics = {
        symbols = {
          error = "",
          warn = "",
          hint = "",
          info = "",
        },
      },
    },
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false
    },
    filesystem = {
      follow_current_file = {
        enabled = true
      },
      group_empty_dirs = true,
    },
    buffers = {
      follow_current_file = {
        enabled = true
      },
      group_empty_dirs = true,
    },
  }

  require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "awk", "bash", "c", "comment", "cpp", "diff", "dockerfile", "fish",
      "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
      "go", "html", "htmldjango", "java", "javascript", "json", "json5",
      "jsonc", "lua", "markdown", "markdown_inline", "python", "query",
      "regex", "rust", "scss", "sql", "toml", "tsx", "typescript", "vim", "vue",
      "yaml", "zig",
    },
    matchup = {
      enable = true,
    },
  }

  require("noice").setup{
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { icon = "  " },
      },
    }
  }

  require('window-picker').setup()
END
