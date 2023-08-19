return {
    'lervag/vimtex',
    'tpope/vim-dispatch',
    'rebelot/kanagawa.nvim',
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        build = "make install_jsregexp"
    },
    'rafamadriz/friendly-snippets',
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.1',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    },
    "barreiroleo/ltex-extra.nvim",
    "anuvyklack/hydra.nvim",
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    },
    -- use { "mrjones2014/smart-splits.nvim" }
    "voldikss/vim-floaterm",

    "Exafunction/codeium.vim",
    {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                auto_save_enabled = true,
                auto_restore_enabled = true,
            }
        end
    },
    {
        'rmagatti/session-lens',
        dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
        config = function()
            require('session-lens').setup({ prompt_title = "Sessions" })
        end
    },
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
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end
    },
    "nacro90/numb.nvim",
    "andrewferrier/wrapping.nvim",
    'mrjones2014/smart-splits.nvim',
    {
        'andymass/vim-matchup',
        setup = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },
    'echasnovski/mini.nvim',
}
