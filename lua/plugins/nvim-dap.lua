return {
    {
        'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        dependencies = { 'nvimtools/hydra.nvim' },
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

            vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = "[d]ebugger [t]oggle breakpoint" })
            vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "[d]ebugger [c]ontinue" })

            -- Debug mode: <leader>dd enters, stepping keys stay active until <Esc>/q.
            -- Pink: keys that are not heads keep their normal meaning.
            local Hydra = require("hydra")
            Hydra({
                name = "Debug",
                mode = "n",
                body = "<leader>dd",
                hint = [[
 _c_: continue/start   _n_: step over   _b_: breakpoint        _K_: eval
 _r_: run last         _i_: step into   _B_: cond. breakpoint  _u_: toggle UI
 _C_: run to cursor    _o_: step out    _R_: REPL
 _x_: terminate
 ^ ^                       _q_/_<Esc>_: quit
]],
                config = {
                    color = "pink",
                    invoke_on_body = true,
                    hint = { type = "window", position = "bottom", show_name = true },
                },
                heads = {
                    { "c", dap.continue,                                                  { desc = "continue" } },
                    { "r", dap.run_last,                                                  { desc = "run last" } },
                    { "C", dap.run_to_cursor,                                             { desc = "run to cursor" } },
                    { "x", dap.terminate,                                                 { desc = "terminate" } },
                    { "n", dap.step_over,                                                 { desc = "step over" } },
                    { "i", dap.step_into,                                                 { desc = "step into" } },
                    { "o", dap.step_out,                                                  { desc = "step out" } },
                    { "b", dap.toggle_breakpoint,                                         { desc = "breakpoint" } },
                    { "B", function() dap.set_breakpoint(vim.fn.input("Condition: ")) end, { desc = "conditional breakpoint" } },
                    { "R", dap.repl.toggle,                                               { desc = "REPL" } },
                    { "K", function() require("dapui").eval() end,                        { desc = "eval" } },
                    { "u", function() require("dapui").toggle() end,                      { desc = "toggle UI" } },
                    { "q",     nil, { exit = true, nowait = true, desc = "quit" } },
                    { "<Esc>", nil, { exit = true, nowait = true, desc = "quit" } },
                },
            })
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
            vim.keymap.set('n', '<leader>do', require('dapui').open, { desc = "[d]ebugger UI [o]pen" })
            vim.keymap.set('n', '<leader>dx', require('dapui').close, { desc = "[d]ebugger UI close ([x])" })
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
