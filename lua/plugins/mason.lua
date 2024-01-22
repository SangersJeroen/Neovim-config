return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                'pyright',
                'mypy',
                'ruff',
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
                    'pyright',
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
    -- {
    --     'jose-elias-alvarez/null-ls.nvim',
    --     ft = { 'python' },
    --     opts = function()
    --         return require "null-ls.customs"
    --     end,
    -- },
    -- {
    --     "jay-babu/mason-null-ls.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "jose-elias-alvarez/null-ls.nvim",
    --     },
    --     config = function()
    --         require("mason-null-ls").setup({
    --             ensure_installed = { "black" }
    --         })
    --     end,
    -- },
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
