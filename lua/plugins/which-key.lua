-- Options follow the which-key v3 schema (see :h which-key.nvim-which-key-configuration)
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        preset = "classic", -- classic = popup along the bottom of the screen
        plugins = {
            marks = true,     -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true, -- show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20,
            },
            presets = {
                operators = true,    -- adds help for operators like d, y, ...
                motions = true,      -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true,      -- default bindings on <c-w>
                nav = true,          -- misc bindings to work with windows
                z = true,            -- bindings for folds, spelling and others prefixed with z
                g = true,            -- bindings for prefixed with g
            },
        },
        win = {
            border = "none",
            padding = { 1, 2 }, -- {top/bottom, left/right}
            zindex = 1000,
            wo = { winblend = 0 },
        },
        layout = {
            width = { min = 20, max = 50 },
            spacing = 3,
            align = "left",
        },
        keys = {
            scroll_down = "<c-d>",
            scroll_up = "<c-u>",
        },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        },
        show_help = true,
        show_keys = true,
        spec = {
            { "gc", group = "Comments", mode = { "n", "v" } },
        },
    },
}
