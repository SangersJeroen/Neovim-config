return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                auto_load = true,        -- whether to automatically load preview when
                -- entering another markdown buffer
                close_on_bdelete = true, -- close preview window on buffer delete

                syntax = true,           -- enable syntax highlighting, affects performance

                theme = 'dark',          -- 'dark' or 'light'

                update_on_change = true,

                app = 'browser',           -- 'webview', 'browser', string or a table of strings

                filetype = { 'markdown' }, -- list of filetypes to recognize as markdown

                -- relevant if update_on_change is true
                throttle_at = 200000,   -- start throttling when file exceeds this
                -- amount of bytes in size
                throttle_time = 'auto', -- minimum amount of time in milliseconds
                -- that has to pass before starting new render
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

            vim.keymap.set('n', '<leader>po', '<CMD>PeekOpen<CR>')
            vim.keymap.set('n', '<leader>pc', '<CMD>PeekClose<CR>')
        end,
    },
}
