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
map('n', '[g', function() require('gitsigns').nav_hunk('prev') end)
map('n', ']g', function() require('gitsigns').nav_hunk('next') end)
map('n', 'gs', function() require('gitsigns').preview_hunk() end)
map('n', 'go', ':GBrowse<CR>')
map('n', '<Leader>gu', function() require('gitsigns').reset_hunk() end)

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

-- LSP mappings
-- Drop the builtin gr* defaults so `gr` (references) doesn't wait for more keys
for _, lhs in ipairs({ 'gra', 'gri', 'grn', 'grr', 'grt', 'grx' }) do
    pcall(vim.keymap.del, { 'n', 'x' }, lhs)
end

local function jump_diagnostic(count, severity)
    return function() vim.diagnostic.jump({ count = count, severity = severity, float = true }) end
end
map('n', '[d', jump_diagnostic(-1, vim.diagnostic.severity.ERROR))
map('n', ']d', jump_diagnostic(1, vim.diagnostic.severity.ERROR))
map('n', '[s', jump_diagnostic(-1))
map('n', ']s', jump_diagnostic(1))
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gy', vim.lsp.buf.type_definition)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', 'gr', vim.lsp.buf.references)
map('n', '<Leader>rn', vim.lsp.buf.rename)
map({ 'n', 'x' }, '<Leader>f', function() require('conform').format({ async = true }) end)
map('n', '<Leader>cl', vim.lsp.codelens.run)
map('n', '<C-s>', 'van', { remap = true })
map('x', '<C-s>', 'an', { remap = true })

-- Code actions
map({ 'n', 'x' }, '<Leader>a', vim.lsp.buf.code_action)
map('n', '<Leader>ac', vim.lsp.buf.code_action)
map('n', '<Leader>as', function()
    vim.lsp.buf.code_action({ context = { only = { 'source' }, diagnostics = {} } })
end)
map('n', '<Leader>qf', function()
    vim.lsp.buf.code_action({ context = { only = { 'quickfix' }, diagnostics = {} }, apply = true })
end)
map('n', '<Leader>re', function()
    vim.lsp.buf.code_action({ context = { only = { 'refactor' }, diagnostics = {} } })
end)
map({ 'n', 'x' }, '<Leader>r', function()
    vim.lsp.buf.code_action({ context = { only = { 'refactor' }, diagnostics = {} } })
end)

-- LSP pickers (replaces CocList)
map('n', '<space>a', ':Telescope diagnostics<CR>')
map('n', '<space>c', ':Telescope commands<CR>')
map('n', '<space>o', ':Telescope lsp_document_symbols<CR>')
map('n', '<space>s', ':Telescope lsp_dynamic_workspace_symbols<CR>')
map('n', '<space>p', ':Telescope resume<CR>')

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

