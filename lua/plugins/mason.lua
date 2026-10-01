return {
    {
        "williamboman/mason.nvim",
        opts = {},
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
                -- Servers configured in lspconfig/customs.lua but deliberately not enabled.
                -- rust_analyzer is managed by rustaceanvim.
                automatic_enable = {
                    exclude = { 'zls', 'texlab', 'harper_ls', 'lemminx', 'rust_analyzer' },
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
