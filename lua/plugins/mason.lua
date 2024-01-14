return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                'pyright',
                'mypy',
                'ruff',
            }
        },
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
        },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'pyright',
                    'lua_ls',
                    'ltex',
                },
            })
        end,
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                    'black',
                    'debugpy',
                },
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require "lspconfig.customs"
        end,
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        ft = { 'python' },
        opts = function()
            return require "null-ls.customs"
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { "black" }
            })
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('nvim-cmp.config')
        end,
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua'
}
