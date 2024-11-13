-- Create augroups
local function augroup(name)
    return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

-------------------------------------------------------------------------------
-- Filetypes
-------------------------------------------------------------------------------

-- Set specific filetypes
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = augroup("filetypes"),
    pattern = {
        "*.pt",
        "*.zcml",
    },
    callback = function()
        vim.opt_local.iskeyword:append("-")
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- Set file types for specific extensions
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = augroup("special_filetypes"),
    pattern = {
        "*.fish",
        "*.zcml",
        "*.jinja",
        "*.j2",
        "*.mako",
        "*.miv1",
        "*.spec",
        "emperor.yml",
    },
    callback = function(ev)
        local extension_to_filetype = {
            fish = "sh",
            zcml = "xml",
            ["jinja"] = "htmljinja",
            ["j2"] = "htmljinja",
            mako = "mako",
            miv1 = "json",
            spec = "python",
            yml = function(filename)
                if filename == "emperor.yml" then
                    return "yaml.ansible"
                end
            end
        }

        local ext = vim.fn.fnamemodify(ev.match, ":e")
        local filename = vim.fn.fnamemodify(ev.match, ":t")

        local filetype = extension_to_filetype[ext]
        if type(filetype) == "function" then
            filetype = filetype(filename)
        end

        if filetype then
            vim.bo[ev.buf].filetype = filetype
        end
    end,
})

-- Set JSON comment highlighting
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = augroup("json_comments"),
    pattern = "json",
    command = [[syntax match Comment +\/\/.\+$+]],
})

-- Set indent settings for specific filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = augroup("indent_settings"),
    pattern = {
        "fish",
        "sh",
        "rst",
        "markdown",
        "md",
        "html",
        "xml",
        "javascript",
        "css",
        "scss",
        "sass",
        "less",
        "scss.css",
        "yaml",
        "yml",
        "sshconfig"
    },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- Add - to iskeyword for specific filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = augroup("iskeyword_settings"),
    pattern = {
        "fish",
        "sh",
        "rst",
        "markdown",
        "md",
        "html",
        "xml",
        "javascript",
        "css",
        "scss",
        "sass",
        "less",
        "scss.css",
        "yaml",
        "yml"
    },
    callback = function()
        vim.opt_local.iskeyword:append("-")
    end,
})

-------------------------------------------------------------------------------
-- Python Settings
-------------------------------------------------------------------------------

-- Python specific settings
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = augroup("python_settings"),
    pattern = "python",
    callback = function()
        vim.g.python_highlight_all = 1
        -- Disable specific COC sources for Python
        vim.b.coc_disabled_sources = {'around', 'yank', 'file'}
    end,
})

-- Python formatting on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("python_format"),
    pattern = "*.py",
    callback = function()
        vim.cmd("silent call CocAction('runCommand', 'python.sortImports')")
    end,
})

-------------------------------------------------------------------------------
-- COC Settings
-------------------------------------------------------------------------------

-- Highlight symbol under cursor on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
    group = augroup("coc_highlight"),
    pattern = "*",
    callback = function()
        vim.fn.CocActionAsync('highlight')
    end,
})

-- Setup formatexpr for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("coc_format"),
    pattern = {"typescript", "json"},
    callback = function()
        vim.opt_local.formatexpr = "CocAction('formatSelected')"
    end,
})

-- Update signature help on placeholder jump
vim.api.nvim_create_autocmd("User", {
    group = augroup("coc_signature"),
    pattern = "CocJumpPlaceholder",
    callback = function()
        vim.fn.CocActionAsync('showSignatureHelp')
    end,
})

-------------------------------------------------------------------------------
-- Other Settings
-------------------------------------------------------------------------------

-- Dictionary loading
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    group = augroup("load_dict"),
    pattern = "*",
    callback = function()
        local dict_path = vim.fn.expand('~/.vim/dictionaries/' .. vim.fn.expand('%:e') .. '.txt')
        if vim.fn.filereadable(dict_path) == 1 then
            vim.opt_local.dictionary:append(dict_path)
        end
    end,
})

-- Go imports organizing
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("go_imports"),
    pattern = "*.go",
    callback = function()
        vim.cmd("silent call CocAction('runCommand', 'editor.action.organizeImport')")
    end,
})

-- COC format selected
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("coc_typescript"),
    pattern = "typescript,json",
    command = [[setl formatexpr=CocAction('formatSelected')]],
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = augroup("coc_placeholder"),
    pattern = "CocJumpPlaceholder",
    command = [[call CocActionAsync('showSignatureHelp')]],
})
