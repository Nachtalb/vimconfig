return {
    { "LazyVim/LazyVim",               version = false },

    -- Git integration
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        dependencies = { "tpope/vim-rhubarb" },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",          -- optional
            "echasnovski/mini.pick",     -- optional
        },
    },
    -- Editor enhancement
    { "tpope/vim-surround",            event = "VeryLazy" },
    { "tpope/vim-unimpaired",          event = "VeryLazy" },
    { "machakann/vim-highlightedyank", event = "VeryLazy" },
    { "sheerun/vim-polyglot" },
    -- { "preservim/nerdcommenter",       event = "VeryLazy" },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },
    -- { "numirias/semshi",               ft = "python" },

    -- AI assistance
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
        cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
        init = function()
            -- v0.2+: pure Lua server, configured through a global
            vim.g.live_server = { port = 5500 }
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

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { '~/', '~/src', '~/Downloads', '/' },
            -- log_level = 'debug',
        }
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            image = { enabled = true },
            notify = { enabled = true },
            scroll = { enabled = false },
        },
    },
    {
        'echasnovski/mini.icons',
        version = '*',
        config = function()
            require('mini.icons').setup()
        end
    },
    {
        'MagicDuck/grug-far.nvim',
        config = function()
            -- optional setup call to override plugin options
            -- alternatively you can set options with vim.g.grug_far = { ... }
            require('grug-far').setup({
                -- options, see Configuration section below
                -- there are no required options atm
                -- engine = 'ripgrep' is default, but 'astgrep' or 'astgrep-rules' can
                -- be specified
            });
        end
    },
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     ---@type Flash.Config
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    --         { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    --         { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    --         { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --         { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    --     },
    -- },
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        },
        config = function(_, opts)
            require("mini.pairs").setup(opts)
        end,
    },
}
