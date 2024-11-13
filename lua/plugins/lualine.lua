local function get_git_branch()
    local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
    if branch ~= "" then
        return branch
    end
    return ""
end

return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            local colors = {
                blue    = '#b1baf4',
                cyan    = '#b3f4f3',
                black   = '#1c1924',
                white   = '#eee9fc',
                red     = '#e965a5',
                violet  = '#e192ef',
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

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = hardhacker_theme,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    globalstatus = false,
                },
            }
        end,
    },
}
