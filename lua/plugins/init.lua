return {
    'tpope/vim-dispatch',
    {
        'rebelot/kanagawa.nvim',
        config = function()
            require('kanagawa').setup()
            vim.cmd("colorscheme kanagawa")
        end,
    },

    -- Pluggins for LaTeX editting
    'lervag/vimtex',
    'rafamadriz/friendly-snippets',
    'barreiroleo/ltex-extra.nvim',

    {
        'theprimeagen/harpoon',
        config = function()
            local mark = require('harpoon.mark')
            local ui = require('harpoon.ui')

            vim.keymap.set('n', '<leader>a', mark.add_file)
            vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

            vim.keymap.set('n', '<C-p>', function() ui.nav_file(1) end)
            vim.keymap.set('n', '<C-q>', function() ui.nav_file(2) end)
            vim.keymap.set('n', '<C-r>', function() ui.nav_file(3) end)
            vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)
        end,
    },

    {
        'Exafunction/codeium.vim',
        config = function()
            vim.keymap.set('i', '<c-c>', function() return vim.fn["codeium#Complete"]() end, { expr = true })
            vim.keymap.set('i', '<M-a>', function() return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<M-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<M-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end,
    },
    "anuvyklack/hydra.nvim",

    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            local hop = require('hop')
            local directions = require('hop.hint').HintDirection

            require 'hop'.setup {
                keys = 'etovxqpdygfblzhckisuran',
                quit_key = ' <SPC>',
                multi_windows = true,
            }

            vim.keymap.set('n', '<M-f>',
                function() hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false }) end)
            vim.keymap.set('n', '<M-F>',
                function() hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end)
            vim.keymap.set('n', '<M-w>', function() hop.hint_words() end)
        end,
    },

    "voldikss/vim-floaterm",
    "folke/which-key.nvim",
    "linux-cultist/venv-selector.nvim",

    {
        "epwalsh/obsidian.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    { "toppair/peek.nvim", build = 'deno task --quiet build:fast' },

    {
        "christoomey/vim-tmux-navigator",
        config = function()
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-h>', "<cmd> TmuxNavigateLeft<CR>")
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-l>', "<cmd> TmuxNavigateRight<CR>")
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-j>', "<cmd> TmuxNavigateDown<CR>")
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-k>', "<cmd> TmuxNavigateUp<CR>")
        end,
    },
    "lukas-reineke/indent-blankline.nvim",
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },
    {
        "cshuaimin/ssr.nvim",
        module = "ssr",
        -- Calling setup is optional.
        config = function()
            require("ssr").setup {
                border = "rounded",
                min_width = 50,
                min_height = 5,
                max_width = 120,
                max_height = 25,
                keymaps = {
                    close = "q",
                    next_match = "n",
                    prev_match = "N",
                    replace_confirm = "<cr>",
                    replace_all = "<leader><cr>",
                },
            }
            vim.keymap.set({ "n", "x" }, "<leader>r", function() require("ssr").open() end)
        end
    },

    {
        'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end
    },


    {
        "andrewferrier/wrapping.nvim",
        config = function()
            local options = {
                create_keymappings = false,
                auto_set_mode_filetype_allowlist = {
                    "asciidoc",
                    "gitcommit",
                    "latex",
                    "mail",
                    "markdown",
                    "rst",
                    "tex",
                    "text",
                },
                auto_set_mode_heuristically = false
            }

            require("wrapping").setup(options)

            vim.keymap.set("n", "<leader>ww", '<cmd>HardWrapMode<CR>')
            vim.keymap.set("n", "<leader>WW", '<cmd>ToggleWrapMode<CR>')
        end,
    },

    {
        'andymass/vim-matchup',
        setup = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },

    'echasnovski/mini.nvim',
}
