return {
    {
        'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        config = function()
            local dap = require("dap")
            
            dap.adapters.python = {
                type = "executable",
                command = "python3",
                args = {"-m", "debugpy.adapter"},
            }

            local get_args = function ()
                local cmd_args = vim.fn.input('CMD Args: ')
                local params = {}
                local sep = "%s"
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
                    pythonPath = function ()
                        local venv_path = os.getenv("VIRTUAL_ENV")
                        if venv_path  then 
                            return venv_path .. "/bin/python"
                        end
                        return "/usr/bin/python3"
                    end
                },
            }

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
