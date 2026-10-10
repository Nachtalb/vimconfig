-- nvim-treesitter (main branch): installs parsers and queries only.
-- Highlighting, indent and folding are switched on per buffer below.
local parsers = {
    "awk",
    "bash",
    "c",
    "comment",
    "cpp",
    "diff",
    "dockerfile",
    "fish",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "html",
    "htmldjango",
    "java",
    "javascript",
    "json",
    "json5",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "rust",
    "scss",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
                callback = function(args)
                    if not pcall(vim.treesitter.start, args.buf) then
                        return
                    end
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    vim.wo.foldmethod = "expr"
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                end,
            })

            vim.opt.foldenable = false -- Disable folding at startup
        end,
    },

    -- Function / class text objects (replaces coc-funcobj / coc-classobj)
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true },
            })

            local select = require("nvim-treesitter-textobjects.select")
            for lhs, query in pairs({
                af = "@function.outer",
                ["if"] = "@function.inner",
                ac = "@class.outer",
                ic = "@class.inner",
            }) do
                vim.keymap.set({ "x", "o" }, lhs, function()
                    select.select_textobject(query, "textobjects")
                end, { desc = query })
            end
        end,
    },
}
