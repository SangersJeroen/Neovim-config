return {
    {
        'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        config = function()
            local dap = require("dap")

            vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "DAP Continue" })
        end,
        dependecies = {
            "rcarriga/nvim-dap-ui",
        },
    },

    {
        'mfussenegger/nvim-dap-python',
        config = function()
            require('dap-python').setup('python')
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        dependecies = {
            'mfussenegger/nvim-dap',
            'folke/neodev.nvim',

        },
        config = function ()
            require('dapui').setup()
            vim.keymap.set('n', '<leader>do', require('dapui').open, {desc = "DAPui Open"})
            vim.keymap.set('n', '<leader>dx', require('dapui').close, {desc = "DAPui Close"})
        end,
    },
    'theHamsta/nvim-dap-virtual-text',
    {
        'folke/neodev.nvim',
        config = function()
            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
        end,
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        event = 'VeryLazy',
        dependecies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        opts = {
            handlers = {},
            ensure_installed = {
                'codelldb',
            },
        },
    },
}
