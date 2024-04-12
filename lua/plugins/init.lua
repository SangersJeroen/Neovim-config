return {
    'tpope/vim-sleuth',
    'tpope/vim-dispatch',
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme tokyonight-night]]
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                light_style = "day",    -- The theme is used when the background is set to light
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = { bold = true },
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark",            -- style for sidebars, see below
                    floats = "dark",              -- style for floating windows
                },
                sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = true,              -- dims inactive windows
                lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
            })
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
            local gs = package.loaded.gitsigns
            vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {desc='stage chunk'})
            vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {desc='reset chunk'})
            vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, {desc='stage selected'})
            vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, {desc='reset selected'})
            vim.keymap.set('n', '<leader>hS', gs.stage_buffer, {desc='stage file'})
            vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, {desc='undo stage'})
            vim.keymap.set('n', '<leader>hR', gs.reset_buffer, {desc='reset file'})
            vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {desc='preview chunk'})
            vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, {desc='full blame'})
            vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, {desc='toggle blame'})
            vim.keymap.set('n', '<leader>hd', gs.diffthis, {desc='diff this'})
            vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, {desc='diff this'})
            vim.keymap.set('n', '<leader>td', gs.toggle_deleted, {desc='show deleted'})
        end
    },

    {
        'theprimeagen/harpoon',
        config = function()
            local mark = require('harpoon.mark')
            local ui = require('harpoon.ui')

            vim.keymap.set('n', '<leader>a', mark.add_file)
            vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

            vim.keymap.set('n', '<M-1>', function() ui.nav_file(1) end)
            vim.keymap.set('n', '<M-2>', function() ui.nav_file(2) end)
            vim.keymap.set('n', '<M-3>', function() ui.nav_file(3) end)
            vim.keymap.set('n', '<M-4>', function() ui.nav_file(4) end)
            vim.keymap.set('n', '<M-q>', function() ui.nav_file(5) end)
            vim.keymap.set('n', '<M-w>', function() ui.nav_file(6) end)
            vim.keymap.set('n', '<M-e>', function() ui.nav_file(7) end)
            vim.keymap.set('n', '<M-r>', function() ui.nav_file(8) end)
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
                keys = 'asdfghjkl;qweruiopvncm',
                -- keys = 'etovxqpdygfblzhckisuran',
                quit_key = ' <SPC>',
                multi_windows = true,
            }

            vim.keymap.set('n', '<M-f>', function() hop.hint_words() end)
        end,
    },

    "folke/which-key.nvim",

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
        'andymass/vim-matchup',
        config = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },

    'echasnovski/mini.nvim',
    {
        "sustech-data/wildfire.nvim",
        config = function()
            opts = {
                {
                    surrounds = {
                        { "(", ")" },
                        { "{", "}" },
                        { "<", ">" },
                        { "[", "]" },
                    },
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        node_decremental = "<BS>",
                    },
                    filetype_exclude = { "qf" }, --keymaps will be unset in excluding filetypes
                }
            }
            require("wildfire").setup(opts)
        end,
    }
}
