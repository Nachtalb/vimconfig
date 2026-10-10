-- Native LSP setup (replaces coc.nvim + semshi)
--
-- Python is handled by Astral tooling that lives outside of mason:
--   ty   - types, navigation, hover, completion, semantic highlighting
--   ruff - lint, quick fixes, import sorting, formatting
-- Install/upgrade them with `uv tool install ty ruff`. Both pick up the
-- project's `.venv` created by `uv sync` automatically.

-- Language servers installed through mason (lspconfig names)
local mason_servers = {
    "ansiblels",
    "bashls",
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "lemminx",
    "lua_ls",
    "rust_analyzer",
    "taplo",
    "ts_ls",
    "vimls",
    "yamlls",
}

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = { check = { command = "clippy" } },
                },
            })

            vim.lsp.config("clangd", {
                cmd = { "clangd", "--clang-tidy" },
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.VIMRUNTIME },
                        },
                    },
                },
            })

            -- ty answers hover, so ruff only provides lint, fixes and formatting
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp_ruff_no_hover", { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.name == "ruff" then
                        client.server_capabilities.hoverProvider = false
                    end
                end,
            })

            vim.lsp.enable({ "ty", "ruff" })

            -- System-installed servers, enabled only when present
            for _, server in ipairs({ "clangd", "terraformls" }) do
                local cmd = vim.lsp.config[server].cmd
                if type(cmd) == "table" and vim.fn.executable(cmd[1]) == 1 then
                    vim.lsp.enable(server)
                end
            end

            require("mason-lspconfig").setup({
                ensure_installed = mason_servers,
                automatic_enable = true,
            })

            vim.diagnostic.config({
                severity_sort = true,
                float = { border = "rounded", source = "if_many" },
                virtual_text = { spacing = 2, source = "if_many" },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                    },
                },
            })
        end,
    },

    {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
        opts = {},
    },

    -- Completion
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {
            keymap = {
                preset = "enter",
                -- <Tab> stays with Codeium
                ["<Tab>"] = false,
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<C-a>"] = { "accept", "fallback" },
                ["<C-j>"] = { "snippet_forward", "fallback" },
                ["<C-k>"] = { "snippet_backward", "fallback" },
            },
            completion = {
                documentation = { auto_show = true, window = { border = "rounded" } },
                menu = { border = "rounded" },
            },
            signature = { enabled = true, window = { border = "rounded" } },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
    },

    -- Format on save; falls back to the language server for unlisted filetypes
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        opts = {
            formatters_by_ft = {
                python = { "ruff_organize_imports", "ruff_format" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
            },
            formatters = {
                prettier = {
                    prepend_args = { "--print-width", "120", "--tab-width", "2", "--prose-wrap", "always" },
                },
            },
            default_format_opts = { lsp_format = "fallback" },
            format_on_save = { timeout_ms = 2000 },
        },
    },

    -- Git signs (replaces coc-git)
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
}
