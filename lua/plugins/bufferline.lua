return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant",
          indicator = {
            style = "icon",
          },
          close_command = "Bdelete! %d",
          diagnostics_indicator = function(count)
            if count > 9 then
              return "9+"
            end
            return tostring(count)
          end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "EXPLORER",
              text_align = "center",
            },
          },
          hover = {
            enabled = true,
            delay = 0,
            reveal = { "close" },
          },
          custom_filter = function(buf_number)
            local exclude_ft = { "qf", "fugitive", "git" }
            local ft = vim.bo[buf_number].filetype
            if vim.tbl_contains(exclude_ft, ft) then
              return false
            end
            return true
          end,
          groups = {
            options = {
              toggle_hidden_on_enter = true
            },
            items = {
              {
                name = "Tests",
                icon = "󰙨",
                matcher = function(buf)
                  return buf.name and (buf.name:match('_test') or buf.name:match('test_'))
                end,
              },
              {
                name = "Docs",
                icon = "",
                matcher = function(buf)
                  local ft = vim.bo[buf.id].filetype
                  return ft == "markdown" or ft == "rst" or ft == "txt"
                end,
              },
            }
          },
        },
        highlights = {
          buffer_selected = {
            bold = true,
            italic = false,
          },
        },
      })
    end,
  }
}
