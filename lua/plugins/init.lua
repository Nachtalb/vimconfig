return {
    -- Git integration
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        dependencies = { "tpope/vim-rhubarb" },
    },
    -- Editor enhancement
    { "tpope/vim-surround",            event = "VeryLazy" },
    { "tpope/vim-unimpaired",          event = "VeryLazy" },
    { "machakann/vim-highlightedyank", event = "VeryLazy" },
    { "preservim/nerdcommenter",       event = "VeryLazy" },
    -- { "numirias/semshi",               ft = "python" },

    -- AI assistance
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
    },
    -- { "github/copilot.vim",            event = "VeryLazy" },
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             suggestion = { enabled = false },
    --             panel = { enabled = false },
    --         })
    --     end,
    --     {
    --         "zbirenbaum/copilot-cmp",
    --         after = { "copilot.lua" },
    --         config = function()
    --             require("copilot_cmp").setup()
    --         end
    --     }
    -- },

    -- Development tools
    { "mattn/emmet-vim",              ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" } },
    { "vim-scripts/indentpython.vim", ft = "python" },
    { "dag/vim-fish",                 ft = "fish" },
    { "hashivim/vim-terraform",       ft = "terraform" },
    { "elixir-editors/vim-elixir",    ft = "elixir" },

    -- File navigation and search
    { "easymotion/vim-easymotion",    event = "VeryLazy" },
    { "mbbill/undotree",              cmd = "UndotreeToggle" },
    { "majutsushi/tagbar",            cmd = "TagbarToggle" },

    -- Tools and utilities
    { "skywind3000/asyncrun.vim",     cmd = "AsyncRun" },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn install",
        ft = "markdown",
    },
    {
        "barrett-ruth/live-server.nvim",
        build = "yarn global add live-server",
        cmd = "LiveServer",
        config = function()
            require("live-server").setup({
                args = {
                    "--port=5500",
                    "--browser=wsl-open",
                }
            })
        end,
    },

    -- Mason (package manager)
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mini plugins
    {
        "echasnovski/mini.indentscope",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mini.indentscope").setup({
                draw = {
                    delay = 0,
                    animation = require("mini.indentscope").gen_animation.none()
                },
                symbol = "▏",
                options = { try_as_border = false },
            })
        end,
    },
    {
        'echasnovski/mini.cursorword',
        version = false,
        config = function()
            require("mini.cursorword").setup({
                delay = 0,
            })
        end,
    },
    {
        'echasnovski/mini.surround',
        version = false,
        config = function()
            require("mini.surround").setup({
                delay = 0,
            })
        end,
    },

    -- Additional nice-to-haves
    { "mg979/vim-visual-multi", event = "VeryLazy" },
    { "chrisbra/unicode.vim",   cmd = "Unicode" },
    { "junegunn/goyo.vim",      cmd = "Goyo" },
    { "moll/vim-bbye",          cmd = "Bdelete" },
    -- { "dstein64/vim-startuptime", cmd = "StartupTime" },
    {
        "norcalli/nvim-colorizer.lua",
        lazy = false,
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        'rmagatti/auto-session',
        lazy = false,
        config = function()
            require('auto-session').setup()
        end,
    }
}
