return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "lua", "vim", "python", "latex", "markdown", "cpp" },
                auto_install = true,
                ignore_install = { "javascript", "help" },
                highlight = {
                    enable = true,
                    disable = { "latex" },
                },
                indent = { enable = true }
            }
        end
    },
    'nvim-treesitter/playground'
}
