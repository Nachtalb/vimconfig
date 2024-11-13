return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
        keys = {
            { "<C-e>", "<cmd>Neotree focus<cr>",                  desc = "Toggle NeoTree" },
            { "<C-f>", "<cmd>Neotree focus reveal_force_cwd<cr>", desc = "NeoTree find file" },
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
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
                        padding = 1,
                        with_markers = true,
                        indent_marker = "│",
                        last_indent_marker = "└",
                        with_expanders = true,
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
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                    follow_current_file = {
                        enabled = true,
                    },
                    group_empty_dirs = true,
                },
                buffers = {
                    follow_current_file = {
                        enabled = true,
                    },
                    group_empty_dirs = true,
                },
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
            })
        end,
    },
}
