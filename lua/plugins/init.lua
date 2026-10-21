return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require('catppuccin').setup({ auto_integrations = true, })
            vim.cmd.colorscheme "catppuccin-mocha"
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#cac911' })
            vim.api.nvim_set_hl(0, 'LineNr', { fg = '#01cac9' })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#cac911' })
        end
    },
    'tpope/vim-sleuth',
}
