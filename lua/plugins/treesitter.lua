return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = { "c", "lua", "vim", "help", "python", "latex", "markdown", "cpp" },
            sync_install = false,
            auto_install = true,
            ignore_install = { "javascript" },
            highlight = {
                enable = true,
                disable = { "latex" },
                additional_vim_regex_highlighting = false
            },
            indent = { enable = true }
        }
    },

    'nvim-treesitter/playground'
}
