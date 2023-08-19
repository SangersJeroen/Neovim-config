return {
    'tpope/vim-dispatch',
    'rebelot/kanagawa.nvim',

    -- Pluggins for LaTeX editting
    'lervag/vimtex',
    'rafamadriz/friendly-snippets',
    'barreiroleo/ltex-extra.nvim',
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        build = "make install_jsregexp"
    },

    'theprimeagen/harpoon',

    'Exafunction/codeium.vim',
    "anuvyklack/hydra.nvim",

    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
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
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    "christoomey/vim-tmux-navigator",
    "lukas-reineke/indent-blankline.nvim",
    'norcalli/nvim-colorizer.lua',
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
        end
    },

    {
        'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end
    },


    "andrewferrier/wrapping.nvim",

    {
        'andymass/vim-matchup',
        setup = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },

    'echasnovski/mini.nvim',
}
