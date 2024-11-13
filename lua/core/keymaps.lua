-- Helper function for mapping keys
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

-------------------------------------------------------------------------------
-- General Mappings
-------------------------------------------------------------------------------

-- Write file as sudo
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('S', 'w !sudo tee % > /dev/null', {})

-- Quick save
map('n', '<Leader>w', ':w<CR>')

-- Clear search highlightinguse
map('n', '<Leader><space>', ':nohlsearch<CR>')

-- Better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Buffer navigation
map('n', '<Tab>', ':bn<CR>')
map('n', '<S-Tab>', ':bp<CR>')
map('n', '<Leader>q', ':bdelete<CR>')
map('n', '<C-q>', ':Bdelete<CR>')

-- Select All
map('n', '<C-a>', 'ggVG')

-- Copy and paste
map('v', '<C-c>', 'y')
map('n', '<Leader>pp', ':setlocal paste!<CR>')

-- Line movement
map('n', '<C-j>', ':m .+1<CR>==')
map('n', '<C-k>', ':m .-2<CR>==')
map('v', '<C-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- Line duplication
map('v', '<C-d>', 'y`>p')

-- Remap 0 to first non-blank character
map('n', '0', '^')

-------------------------------------------------------------------------------
-- Plugin Specific Mappings
-------------------------------------------------------------------------------

-- Telescope
map('n', 'ff', '<cmd>Telescope find_files<cr>')
map('n', 'fa', '<cmd>Telescope find_files no_ignore=true<cr>')
map('n', 'fg', '<cmd>Telescope live_grep<cr>')
map('n', 'fs', '<cmd>Telescope grep_string<cr>')
map('n', 'fb', '<cmd>Telescope buffers<cr>')
map('n', 'fh', '<cmd>Telescope help_tags<cr>')
map('n', '<Leader>?', '<cmd>Telescope keymaps<CR>')
map('n', '<Leader>p', '<cmd>Telescope registers<CR>')

-- NeoTree
map('n', '<C-e>', ':Neotree focus<CR>')
map('i', '<C-e>', '<ESC>:Neotree focus<CR>')
map('n', '<C-f>', ':Neotree focus reveal_force_cwd<CR>')
map('i', '<C-f>', '<ESC>:Neotree focus reveal_force_cwd<CR>')

-- Undotree
map('n', '<F5>', ':UndotreeToggle<CR>')

-- Tagbar
map('n', '<F7>', ':TagbarJumpPrev<CR>')
map('n', '<F8>', ':TagbarToggle<CR>')
map('n', '<F9>', ':TagbarJumpNext<CR>')

-- Git mappings
map('n', '[g', '<Plug>(coc-git-prevchunk)', { silent = true })
map('n', ']g', '<Plug>(coc-git-nextchunk)', { silent = true })
map('n', 'gs', '<Plug>(coc-git-chunkinfo)', { silent = true })
map('n', 'go', ':CocCommand git.browserOpen<CR>')
map('n', '<Leader>gu', ':CocCommand git.chunkUndo<CR>')

map('n', '<Leader>gs', ':Git<CR>')
map('n', '<Leader>gpl', ':Git pull -r<CR>')
map('n', '<Leader>gpu', ':Git push<CR>')
map('n', '<Leader>gpf', ':Git push --force-with-lease<CR>')
map('n', '<Leader>gd', ':Gdiff<CR>')
map('n', '<Leader>gcc', ':Gcommit<CR>')
map('n', '<Leader>gca', ':Git commit --amend --no-edit<CR>')
map('n', '<Leader>gco', ':Git checkout')
map('n', '<Leader>gcb', ':Git checkout -b ne/')
map('n', '<Leader>gl', ':Telescope git_commits<CR>')
map('n', '<Leader>gb', ':Telescope git_branches<CR>')

-- Navigate to git root
map('n', '<Leader>gr', ':cd %:p:h <CR> | :cd `git rev-parse --show-toplevel`<CR>')

-- COC mappings
map('n', '[d', '<Plug>(coc-diagnostic-prev-error)', { silent = true })
map('n', ']d', '<Plug>(coc-diagnostic-next-error)', { silent = true })
map('n', '[s', '<Plug>(coc-diagnostic-prev)', { silent = true })
map('n', ']s', '<Plug>(coc-diagnostic-next)', { silent = true })
map('n', 'gd', '<Plug>(coc-definition)', { silent = true })
map('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
map('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
map('n', 'gr', '<Plug>(coc-references)', { silent = true })
map('n', '<Leader>rn', '<Plug>(coc-rename)', { silent = true })
map('x', '<Leader>f', '<Plug>(coc-format-selected)', { silent = true })
map('n', '<Leader>f', '<Plug>(coc-format-selected)', { silent = true })
map('n', '<Leader>cl', '<Plug>(coc-codelens-action)', { silent = true })
map('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true })
map('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true })

-- COC completion
local coc_opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
-- map('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', coc_opts)
map('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], coc_opts)
map('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], coc_opts)
map('i', '<C-space>', 'coc#refresh()', coc_opts)


-- COC function and class text objects
map('x', 'if', '<Plug>(coc-funcobj-i)', { silent = true })
map('o', 'if', '<Plug>(coc-funcobj-i)', { silent = true })
map('x', 'af', '<Plug>(coc-funcobj-a)', { silent = true })
map('o', 'af', '<Plug>(coc-funcobj-a)', { silent = true })
map('x', 'ic', '<Plug>(coc-classobj-i)', { silent = true })
map('o', 'ic', '<Plug>(coc-classobj-i)', { silent = true })
map('x', 'ac', '<Plug>(coc-classobj-a)', { silent = true })
map('o', 'ac', '<Plug>(coc-classobj-a)', { silent = true })

-- COC lists
map('n', '<space>a', ':<C-u>CocList diagnostics<cr>', { silent = true })
map('n', '<space>e', ':<C-u>CocList extensions<cr>', { silent = true })
map('n', '<space>c', ':<C-u>CocList commands<cr>', { silent = true })
map('n', '<space>o', ':<C-u>CocList outline<cr>', { silent = true })
map('n', '<space>s', ':<C-u>CocList -I symbols<cr>', { silent = true })
map('n', '<space>j', ':<C-u>CocNext<CR>', { silent = true })
map('n', '<space>k', ':<C-u>CocPrev<CR>', { silent = true })
map('n', '<space>p', ':<C-u>CocListResume<CR>', { silent = true })

-- Neotest
-- map('n', '<leader>tt', ':NeotestNearest<CR>')
-- map('n', '<leader>tf', ':NeotestFile<CR>')
-- map('n', '<leader>ta', ':Neotest<CR>')
-- map('n', '<leader>ts', ':NeotestSummary<CR>')
-- map('n', '[n', "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>")
-- map('n', ']n', "<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>")

-- AsyncRun
map('n', '<Leader>ar', ':AsyncRun! -raw=1')

-- Command mode mappings
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-k>', '<C-U>')
vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')

-- Visual mode search
vim.cmd([[
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
]])

-- Path copy commands
map('n', 'cp', ":let @* = expand('%')<CR>")
map('n', 'cpp', ":let @* = expand('%:p')<CR>")

-- Helper function for COC tab completion
_G.check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end
