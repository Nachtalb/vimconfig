return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<C-j>'] = actions.preview_scrolling_down,
              ['<C-k>'] = actions.preview_scrolling_up,
            },
            n = {
              ['<C-j>'] = actions.preview_scrolling_down,
              ['<C-k>'] = actions.preview_scrolling_up,
            }
          },
          file_ignore_patterns = {
            "node_modules",
            ".git",
            ".venv",
            "__pycache__",
            "var",
            "tmp",
            "log",
          },
          path_display = { "truncate" },
          layout_config = {
            horizontal = {
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
            },
          },
        },
      })

      -- Load extensions
      telescope.load_extension('ui-select')
      telescope.load_extension('live_grep_args')

      -- Configure live_grep_args shortcuts
      local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
      vim.keymap.set("n", "<leader>fs", live_grep_args_shortcuts.grep_word_under_cursor)
    end,
  },
}
