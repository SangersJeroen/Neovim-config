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
    {
        'stevearc/quicker.nvim',
        event = "FileType qf",
        opts = {},
        config = function()
            require("quicker").setup()
        end
    },
    {
        "shortcuts/no-neck-pain.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>nnp", "<cmd>NoNeckPain<cr>", desc = "No Neck Pain", },
        },
        config = function()
            require("no-neck-pain").setup({
                width = 120,               -- Width of the window when No Neck Pain is enabled
                disable_on_zoom = true,    -- Disable No Neck Pain when zooming in
                disable_on_insert = false, -- Disable No Neck Pain when entering insert mode
            })
        end

    },
    'tpope/vim-sleuth',
    'tpope/vim-dispatch',

    -- Pluggins for LaTeX editting
    'lervag/vimtex',
    'barreiroleo/ltex-extra.nvim',

    "anuvyklack/hydra.nvim",
    "folke/which-key.nvim",
    {
        'andymass/vim-matchup',
        config = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },
}
