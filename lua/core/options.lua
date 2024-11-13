local opt = vim.opt
local g = vim.g

-- General
opt.compatible = false        -- Don't be compatible with vi
opt.autoread = true           -- Auto read external changes
opt.hidden = true             -- Allow switching from unsaved buffers
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.exrc = true               -- Enable project specific .vimrc settings

-- UI
opt.number = true                -- Add line numbers
opt.mouse = "a"                  -- Enable mouse support
opt.laststatus = 2               -- Always show status line
opt.cmdheight = 2                -- Height of command bar
opt.showmatch = true             -- Show matching brackets
opt.termguicolors = true         -- Enable true colors support
opt.cursorline = true            -- Highlight current line
opt.signcolumn = "yes"           -- Always show sign column
opt.colorcolumn = "72,80,90,120" -- Add vertical guidelines
opt.list = true                  -- Show special characters
opt.listchars = {                -- Define special characters
    tab = "‣-",
    trail = "·",
    extends = "»",
    precedes = "«"
}
opt.pumblend = 15  -- Popup menu transparency
opt.scrolloff = 10 -- Keep cursor from screen edges

-- Search
opt.incsearch = true  -- Highlight search results while typing
opt.hlsearch = true   -- Highlight all search results
opt.ignorecase = true -- Ignore case while searching
opt.smartcase = true  -- Override ignorecase if uppercase chars are typed

-- Split behavior
opt.splitbelow = true -- Open horizontal splits below
opt.splitright = true -- Open vertical splits to the right

-- Completion
opt.wildmenu = true -- Command-line completion
opt.wildignore = {  -- Ignore files in wildmenu
    "*~",
    "*.pyc",
    "*.pyo",
    "*/.hg/*",
    "*/.svn/*",
    "*/.DS_Store",
    "*/tmp/*",
    "*.so",
    "*.swp",
    "*.documents",
    ".idea",
    "var",
    "log",
    ".git",
    "node_modules",
    ".coffee"
}
opt.complete:append('k')          -- Scan files given with 'dictionary' option
opt.completeopt:remove('preview') -- Remove preview split on completion

-- Editor
opt.wrap = false                   -- Don't wrap lines
opt.backspace = "eol,start,indent" -- Make backspace work as expected
opt.encoding = "utf-8"             -- Set default encoding
opt.fileformats = "unix,dos,mac"   -- Use correct EOL format
opt.magic = true                   -- Enable regex

-- Indentation
opt.tabstop = 4 -- Use correct amount of spaces for tab
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- Use spaces instead of tabs

-- Files
opt.backup = false      -- Don't create backup files
opt.writebackup = false -- Don't create backup files while editing
opt.swapfile = false    -- Don't create swap files

-- Undo
local undodir = vim.fn.expand('~/.vim_runtime/temp_dirs/undodir')
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
opt.undodir = undodir -- Set undo directory
opt.undofile = true   -- Enable persistent undo

-- Performance
opt.updatetime = 300      -- Faster completion
opt.timeoutlen = 500      -- By default timeoutlen is 1000 ms
opt.shortmess:append('c') -- Don't show completion messages

-- Shell settings
if vim.fn.executable('fish') == 1 and vim.o.shell:match('fish$') then
    vim.o.shell = 'bash' -- Use bash if fish is detected
end

-- Spell checking (disabled by default)
opt.spell = false
opt.spelllang = "en"

-- Status line configuration (from your original config)
opt.cmdheight = 2
opt.updatetime = 300
opt.shortmess:append('c')
opt.signcolumn = "yes"

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
    pattern = '*',
})

-- Function to trim trailing whitespace
vim.api.nvim_create_user_command('TrimWhiteSpace', function()
    local save = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(save)
end, {})

-- Auto remove trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = "TrimWhiteSpace"
})
