return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = "VeryLazy",
    config = function()
      -- COC extension list
      vim.g.coc_global_extensions = {
        'coc-browser',
        'coc-cmake',
        'coc-css',
        'coc-cssmodules',
        'coc-eslint',
        'coc-git',
        'coc-html',
        'coc-json',
        'coc-markdownlint',
        'coc-pyright',
        'coc-sh',
        'coc-svg',
        'coc-translator',
        'coc-tsserver',
        'coc-xml',
        'coc-yaml',
        'coc-yank',
        'coc-vimlsp',
        'coc-rust-analyzer',
        'coc-marketplace',
        'coc-snippets',
        'coc-spell-checker',
        'coc-emoji',
        'coc-webview',
        '@yaegassy/coc-ansible',
        'coc-diagnostic',
        'coc-lua',
        'coc-prettier',
        'coc-toml',
      }

      -- Filetype mappings
      vim.g.coc_filetype_map = {
        ['yaml.ansible'] = 'ansible',
        ['jinja2'] = 'htmldjango',
        ['j2'] = 'htmldjango',
      }

      -- Setup snippet navigation
      vim.g.coc_snippet_next = '<c-n>'
      vim.g.coc_snippet_prev = '<c-p>'

      -- Show documentation function
      local function show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end

      -- Format function
      local function format()
        vim.fn.CocAction('format')
        if vim.bo.filetype == 'python' and vim.fn.executable('isort') == 1 then
          vim.fn.CocAction('runCommand', 'python.sortImports')
        else
          vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
        end
      end

      -- Create user commands
      vim.api.nvim_create_user_command('Format', format, {})
      vim.api.nvim_create_user_command('Prettier', 'CocCommand prettier.forceFormatDocument', {})
      vim.api.nvim_create_user_command('OR', 'silent call CocAction(\'runCommand\', \'editor.action.organizeImport\')', {})

      -- Highlight settings
      vim.api.nvim_create_autocmd("CursorHold", {
        pattern = "*",
        callback = function()
          vim.fn.CocActionAsync("highlight")
        end,
      })

      -- Set completion icons
      vim.g.coc_status_error_sign = " "
      vim.g.coc_status_warning_sign = " "

      -- Setup float window options
      vim.g['coc_hover_config'] = {
        border = true,
        rounded = true,
        shadow = true
      }

      vim.g['coc_float_config'] = {
        border = true,
        rounded = true,
        shadow = true
      }

      vim.g['coc_diagnostic_config'] = {
        border = true,
        rounded = true,
        shadow = true,
        focusable = false
      }

      -- Register completion sources
      if vim.fn.exists('*complete_info') then
        vim.cmd([[
          inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
        ]])
      end

      -- Check backspace function for tab completion
      _G.check_back_space = function()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
      end

      return {
        show_documentation = show_docs,
        format = format,
      }
    end,
  },
}
