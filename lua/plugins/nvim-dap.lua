return {
    'mfussenegger/nvim-dap',
    {
        'mfussenegger/nvim-dap-python',
        config = function()
            require "debugging.nvim-dap"
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        requires = {
            'mfussenegger/nvim-dap',
            'folke/neodev.nvim',

        }
    },
    'theHamsta/nvim-dap-virtual-text',
    {
        'folke/neodev.nvim',
        opts = {},
    }
}
