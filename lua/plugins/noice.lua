return {
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("noice").setup({
                cmdline = {
                    view = "cmdline",
                    format = {
                        cmdline = { icon = "  " },
                    },
                },
                messages = {
                    enabled = true,
                    view = "notify",
                    view_error = "notify",
                    view_warn = "notify",
                    view_history = "messages",
                    view_search = "mini",
                },
                -- popupmenu = {
                --     enabled = true,
                --     backend = "nui",
                -- },
                -- commands = {
                --     history = {
                --         view = "split",
                --         opts = { enter = true, format = "details" },
                --         filter = {
                --             any = {
                --                 { event = "notify" },
                --                 { error = true },
                --                 { warning = true },
                --                 { event = "msg_show", kind = { "" } },
                --                 { event = "lsp",      kind = "message" },
                --             }
                --         },
                --     },
                -- },
                -- notify = {
                --     enabled = true,
                --     view = "notify",
                -- },
                -- lsp = {
                --     progress = {
                --         enabled = true,
                --         format = "lsp_progress",
                --         format_done = "lsp_progress_done",
                --         throttle = 1000 / 30,
                --         view = "mini",
                --     },
                --     hover = {
                --         enabled = true,
                --         view = nil,
                --         opts = {},
                --     },
                --     signature = {
                --         enabled = true,
                --         auto_open = {
                --             enabled = true,
                --             trigger = true,
                --             luasnip = true,
                --             throttle = 50,
                --         },
                --         view = nil,
                --         opts = {},
                --     },
                -- },
                -- presets = {
                --     bottom_search = true,
                --     command_palette = true,
                --     long_message_to_split = true,
                --     inc_rename = false,
                --     lsp_doc_border = true,
                -- },
            })
        end,
    },
}
