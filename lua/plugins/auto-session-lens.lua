return {
    {
        'rmagatti/auto-session',
        lazy = false,
        opts = {
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            auto_save_enabled = true,
            auto_restore_enabled = true,
            session_lens = {
                -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
                load_on_setup = true,
                previewer = true,
                mappings = {
                    -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
                    delete_session = { "i", "<C-D>" },
                    alternate_session = { "i", "<C-S>" },
                    copy_session = { "i", "<C-Y>" },
                },
                theme_conf = {
                    border = true,
                },
            },
        },
        keys = {
            -- Will use Telescope if installed or a vim.ui.select picker otherwise
            { '<leader>s',  '<cmd>SessionSearch<CR>', desc = 'Session search' },
            { '<leader>ws', '<cmd>SessionSave<CR>',   desc = 'Save session' },
        },
    },
}
