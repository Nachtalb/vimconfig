return {
    {
        "xiyaowong/transparent.nvim",
        after = "hardhacker",
        config = function()
            require('transparent').setup({
                groups = {
                    'Normal',
                    'NormalNC',
                    'Comment',
                    'Constant',
                    'Special',
                    'Identifier',
                    'Statement',
                    'PreProc',
                    'Type',
                    'Underlined',
                    'Todo',
                    'String',
                    'Function',
                    'Conditional',
                    'Repeat',
                    'Operator',
                    'Structure',
                    'NonText',
                    'SignColumn',
                    'EndOfBuffer',
                }
            })

            -- Clear specific UI elements
            require('transparent').clear_prefix('BufferLine')
            require('transparent').clear_prefix('NeoTree')
        end,
    },
}
