return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                'ruff',
                'python-lsp-server',
                'clangd',
                'clang-format',
                'codelldb',
                'lua_ls',
                'ltex',
                'rust-analyzer',
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
                    'clangd',
                    'lua_ls',
                    'ltex',
                },
            })
            require "lspconfig.customs"
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
            require "lspconfig.customs"
        end,
    },
}
