-- Theme configuration
vim.cmd('colorscheme hardhacker')

-- Custom highlights
vim.cmd('hi TreesitterContextBottom gui=underline guisp=White')
vim.cmd('hi PmenuSel blend=0')

-- Colors for lualine theme
local colors = {
  blue   = '#b1baf4',
  cyan   = '#b3f4f3',
  black  = '#1c1924',
  white  = '#eee9fc',
  red    = '#e965a5',
  violet = '#e192ef',
  comment = '#3f3951',
}

-- Lualine theme configuration
local hardhacker_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.comment },
    c = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

-- Lualine setup
require('lualine').setup({
  options = {
    theme = hardhacker_theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    icons_enabled = true,
    globalstatus = false,
  },
})
