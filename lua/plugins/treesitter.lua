return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.config').setup {
                ensure_installed = { "c", "lua", "vim", "python", "latex", "markdown", "cpp", "html", "yaml" },
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
}
