return {
    {
        'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        config = function()
            local dap = require("dap")

            -- The python adapter itself is registered by nvim-dap-python below.

            local get_args = function()
                local cmd_args = vim.fn.input('CMD Args: ')
                local params = {}
                for param in string.gmatch(cmd_args, "[^%s]+") do
                    table.insert(params, param)
                end
                return params
            end

            dap.configurations.python = {
                {
                    justMyCode = false,
                    type = "python",
                    request = 'launch',
                    name = 'debug file notMyCode',
                    program = '${file}',
                    args = get_args,
                    pythonPath = function()
                        local venv_path = os.getenv("VIRTUAL_ENV")
                        if venv_path then
                            return venv_path .. "/bin/python"
                        end
                        return "/usr/bin/python3"
                    end
                },
            }

            vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "DAP Continue" })
        end,
    },

    {
        'mfussenegger/nvim-dap-python',
        dependencies = { 'mfussenegger/nvim-dap' },
        config = function()
            -- include_configs = false keeps only the custom configuration from the nvim-dap spec
            require('dap-python').setup('python3', { include_configs = false })
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            require('dapui').setup()
            vim.keymap.set('n', '<leader>do', require('dapui').open, { desc = "DAPui Open" })
            vim.keymap.set('n', '<leader>dx', require('dapui').close, { desc = "DAPui Close" })
        end,
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = { 'mfussenegger/nvim-dap' },
        config = function()
            require('nvim-dap-virtual-text').setup()
        end,
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        event = 'VeryLazy',
        dependencies = {
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
