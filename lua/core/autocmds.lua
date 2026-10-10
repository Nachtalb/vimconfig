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
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--     group = augroup("special_filetypes"),
--     pattern = {
--         "*.fish",
--         "*.zcml",
--         "*.jinja",
--         "*.j2",
--         "*.mako",
--         "*.miv1",
--         "*.spec",
--         "emperor.yml",
--     },
--     callback = function(ev)
--         local extension_to_filetype = {
--             fish = "sh",
--             zcml = "xml",
--             ["jinja"] = "htmljinja",
--             ["j2"] = "htmljinja",
--             mako = "mako",
--             miv1 = "json",
--             spec = "python",
--             yml = function(filename)
--                 if filename == "emperor.yml" then
--                     return "yaml.ansible"
--                 end
--             end
--         }
--
--         local ext = vim.fn.fnamemodify(ev.match, ":e")
--         local filename = vim.fn.fnamemodify(ev.match, ":t")
--
--         local filetype = extension_to_filetype[ext]
--         if type(filetype) == "function" then
--             filetype = filetype(filename)
--         end
--
--         if filetype then
--             vim.bo[ev.buf].filetype = filetype
--         end
--     end,
-- })

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
    end,
})

-------------------------------------------------------------------------------
-- Other Settings
-------------------------------------------------------------------------------

-- Dictionary loading
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = augroup("load_dict"),
    pattern = "*",
    callback = function()
        local dict_path = vim.fn.expand('~/.vim/dictionaries/' .. vim.fn.expand('%:e') .. '.txt')
        if vim.fn.filereadable(dict_path) == 1 then
            vim.opt_local.dictionary:append(dict_path)
        end
    end,
})
