return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                'ruff',
                'ruff-lsp',
                -- 'pylyzer',
                'python-lsp-server',
                'clangd',
                'clang-format',
                'codelldb',
                'lua_ls',
                'ltex',
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
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'clangd',
                    'lua_ls',
                    'ltex',
                },
                handlers = {
                    lsp_zero.default_setup,
                }
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
                    'ruff',
                    'mypy',
                    'debugpy',
                },
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()
            require "lspconfig.customs"
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
