return {
    {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                auto_save_enabled = true,
                auto_restore_enabled = true,
            }
        end,
    },
    {
        'rmagatti/session-lens',
        dependencies = {
            'rmagatti/auto-session',
            'nvim-telescope/telescope.nvim'
        },
        config = function()
            require('session-lens').setup({
                prompt_title = "Sessions",
                path_display = { 'shorten' },
                theme = 'ivy'
            })
            vim.keymap.set('n', '<c-s>', '<cmd>SearchSession<CR>')
        end
    }
}
