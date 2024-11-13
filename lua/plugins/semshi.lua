return {
    {
        "wookayin/semshi",              -- maintained fork
        ft = "python",
        build = ":UpdateRemotePlugins", -- don't disable `rplugin` in lazy.nvim for this
        init = function()
            -- better done by LSP
            vim.g["semshi#error_sign"] = false
            vim.g["semshi#simplify_markup"] = false
            vim.g["semshi#mark_selected_nodes"] = false
            vim.g["semshi#update_delay_factor"] = 0.001
            vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
                callback = function()
                    vim.cmd([[
                        highlight! semshiGlobal gui=italic
                        highlight! link semshiImported @lsp.type.namespace
                        highlight! link semshiParameter @lsp.type.parameter
                        highlight! link semshiParameterUnused DiagnosticUnnecessary
                        highlight! link semshiBuiltin @function.builtin
                        highlight! link semshiAttribute @field
                        highlight! link semshiSelf @lsp.type.selfKeyword
                        highlight! link semshiUnresolved @lsp.type.unresolvedReference
                        highlight! link semshiFree @comment
                    ]])
                end,
            })
        end,
    },
}
