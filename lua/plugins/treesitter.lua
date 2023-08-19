return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = {
        ensure_installed = { "c", "lua", "vim", "help", "python", "latex" },
              sync_install = false,
              auto_install = true,
              ignore_install = { "javascript" },
              highlight = {
                enable = true,
                diable = { "latex" },
                additional_vim_regex_highlighting = false,
            }
        }
    },

    'nvim-treesitter/playground'
}
