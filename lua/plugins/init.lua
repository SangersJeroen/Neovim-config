return {
    'tpope/vim-dispatch',
    -- {
    --     'rebelot/kanagawa.nvim',
    --     config = function()
    --         require('kanagawa').setup()
    --         vim.cmd("colorscheme kanagawa")
    --     end,
    -- },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         require("catppuccin").setup({
    --             flavour = "mocha", -- latte, frappe, macchiato, mocha
    --             background = {     -- :h background
    --                 light = "latte",
    --                 dark = "mocha",
    --             },
    --             dim_inactive = {
    --                 enabled = true,          -- dims the background color of inactive window
    --                 shade = "dark",
    --                 percentage = 0.15,       -- percentage of the shade to apply to the inactive window
    --             },
    --             styles = {                   -- Handles the styles of general hi groups (see `:h highlight-args`):
    --                 comments = { "italic" }, -- Change the style of comments
    --                 conditionals = { "italic" },
    --                 loops = {},
    --                 functions = {},
    --                 keywords = {},
    --                 strings = {},
    --                 variables = {},
    --                 numbers = {},
    --                 booleans = {},
    --                 properties = {},
    --                 types = {},
    --                 operators = {},
    --             },
    --             integrations = {
    --                 cmp = true,
    --                 gitsigns = true,
    --                 nvimtree = true,
    --                 treesitter = false,
    --                 notify = false,
    --                 mini = {
    --                     enabled = true,
    --                     indentscope_color = "",
    --                 },
    --             },
    --         })
    --
    --         -- setup must be called before loading
    --         vim.cmd.colorscheme "catppuccin"
    --     end
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme tokyonight-night]]
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                light_style = "day", -- The theme is used when the background is set to light
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = { bold = true},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = true, -- dims inactive windows
                lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param colors ColorScheme
                on_colors = function(colors) end,

                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors) end,
            })
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup(
                {
                    on_attach = function(bufnr)
                        local gs = package.loaded.gitsigns

                        local function map(mode, l, r, opts)
                            opts = opts or {}
                            opts.buffer = bufnr
                            vim.keymap.set(mode, l, r, opts)
                        end

                        -- Navigation
                        map('n', ']c', function()
                            if vim.wo.diff then return ']c' end
                            vim.schedule(function() gs.next_hunk() end)
                            return '<Ignore>'
                        end, { expr = true })

                        map('n', '[c', function()
                            if vim.wo.diff then return '[c' end
                            vim.schedule(function() gs.prev_hunk() end)
                            return '<Ignore>'
                        end, { expr = true })

                        -- Actions
                        map('n', '<leader>hs', gs.stage_hunk)
                        map('n', '<leader>hr', gs.reset_hunk)
                        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                        map('n', '<leader>hS', gs.stage_buffer)
                        map('n', '<leader>hu', gs.undo_stage_hunk)
                        map('n', '<leader>hR', gs.reset_buffer)
                        map('n', '<leader>hp', gs.preview_hunk)
                        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
                        map('n', '<leader>tb', gs.toggle_current_line_blame)
                        map('n', '<leader>hd', gs.diffthis)
                        map('n', '<leader>hD', function() gs.diffthis('~') end)
                        map('n', '<leader>td', gs.toggle_deleted)
                    end
                }
            )
        end
    },

    -- Pluggins for LaTeX editting
    'lervag/vimtex',
    'barreiroleo/ltex-extra.nvim',

    {
        'theprimeagen/harpoon',
        config = function()
            local mark = require('harpoon.mark')
            local ui = require('harpoon.ui')

            vim.keymap.set('n', '<leader>a', mark.add_file)
            vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

            vim.keymap.set('n', '<M-q>', function() ui.nav_file(1) end)
            vim.keymap.set('n', '<M-w>', function() ui.nav_file(2) end)
            vim.keymap.set('n', '<M-e>', function() ui.nav_file(3) end)
            vim.keymap.set('n', '<M-r>', function() ui.nav_file(4) end)
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
                keys = 'asdfghjkl;qweruiopvncm',
                -- keys = 'etovxqpdygfblzhckisuran',
                quit_key = ' <SPC>',
                multi_windows = true,
            }

            vim.keymap.set('n', '<M-f>', function() hop.hint_words() end)
        end,
    },

    "folke/which-key.nvim",
    -- "linux-cultist/venv-selector.nvim",

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
    -- {
    --     'norcalli/nvim-colorizer.lua',
    --     config = function()
    --         require('colorizer').setup()
    --     end,
    -- },
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
