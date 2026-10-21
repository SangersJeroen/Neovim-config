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
        keys = {
            { "<leader>q", function() require("quicker").toggle() end,                   desc = "Toggle [q]uickfix" },
            { "<leader>L", function() require("quicker").toggle({ loclist = true }) end, desc = "Toggle [L]ocation list" },
        },
        opts = {
            keys = {
                { ">", function() require("quicker").expand({ before = 2, after = 2, add_to_existing = true }) end, desc = "Expand quickfix context" },
                { "<", function() require("quicker").collapse() end,                                                 desc = "Collapse quickfix context" },
            },
        },
    },
    {
        "shortcuts/no-neck-pain.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>tn", "<cmd>NoNeckPain<cr>", desc = "[t]oggle [n]o-neck-pain", },
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

    -- Pluggins for LaTeX editting
    {
        'lervag/vimtex',
        lazy = false,
        init = function()
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.tex_flavor = 'lualatex'

            -- vim.g.vimtex_fold_enabled = true
            vim.g.vimtex_format_enabled = true

            -- vim.g.vimtex_view_sioyek_exe = '/home/jeroensangers/.local/bin/sioyek/sioyek'
            vim.g.vimtex_view_method = 'sioyek'

            vim.opt_local.expandtab = true
            vim.opt_local.autoindent = true
            vim.opt_local.tabstop = 2
            vim.opt_local.softtabstop = 2
            vim.fn.setreg("a", "i/\textbf{}")
            vim.keymap.set('n', '<localleader>ll', '<cmd>VimtexCompile<cr>', { desc = 'Compile LaTeX Document' })
            vim.keymap.set('n', '<localleader>lv', '<cmd>VimtexView<cr>', { desc = 'View PDF' })

            vim.g.vimtex_quickfix_ignore_filters = {
                'LaTeX hooks Warning',
                'Underfull \\hbox',
                'Overfull \\hbox',
                'LaTeX Warning: h float specifier changed to',
                'Package siunitx Warning: Detected the "physics" package:',
                'Package hyperref Warning: Token not allowed in a PDF string',
                'Fatal error occurred, no output PDF file produced!'
            }
        end
    },
    'barreiroleo/ltex-extra.nvim',

    "nvimtools/hydra.nvim",
    {
        'andymass/vim-matchup',
        config = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },
}
