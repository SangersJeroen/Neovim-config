return {
    {
        '3rd/image.nvim',
        event = "VeryLazy",
        enabled = function() return not vim.g.neovide end,
        opts = {
            backend = "kitty", -- whatever backend you would like to use
            max_width = 70,
            max_height = 12,
            max_width_window_percentage = math.huge,
            max_height_window_percentage = math.huge,
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = false,
                    only_render_image_at_cursor = false,
                    filetypes = { "markdown" },
                },
            },
        },
    },
    {
        "benlubas/molten-nvim",
        dependencies = { "image.nvim" },
        build = ":UpdateRemotePlugins",
        ft = 'python',
        keys = {
            { "<leader>mi", "<cmd>MoltenInit<cr>",                   mode = 'n', ft = 'python', desc = '[M]olten [i]nit' },
            { "<leader>mf", "<cmd>MoltenImagePopup<cr>",             mode = 'n', ft = 'python', desc = '[M]olten [F]igure' },
            { "<leader>mc", "<cmd>MoltenEvalutateCell<cr>",          mode = 'n', ft = 'python', desc = '[M]olten eval [C]ell' },
            { "<leader>mv", "<cmd>MoltenEvaluateVisual<cr>",         mode = 'n', ft = 'python', desc = '[M]olten eval [V]isual' },
            { "<leader>mh", "<cmd>MoltenHideOutput<cr>",             mode = 'n', ft = 'python', desc = '[M]olten [H]ide output' },
            { "<leader>ms", "<cmd>MoltenShowOutput<cr>",             mode = 'n', ft = 'python', desc = '[M]olten [S]how output' },
            { "<leader>me", "<cmd>:noautocmd MoltenEnterOutput<cr>", mode = 'n', ft = 'python', desc = '[M]olten [E]nter output' },
        },
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_auto_open_output = true
            vim.g.molten_wrap_output = true
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = true
            vim.g.molten_image_location = "float"
        end
    },
    {
        "GCBallesteros/NotebookNavigator.nvim",
        keys = {
            { "]h",        function() require("notebook-navigator").move_cell "d" end },
            { "[h",        function() require("notebook-navigator").move_cell "u" end },
            { "<leader>e", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
            { "<leader>E", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
        },
        dependencies = {
            "echasnovski/mini.comment",
            "benlubas/molten-nvim",
            "anuvyklack/hydra.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("notebook-navigator").setup(
            --     {
            --     activate_hydra_keys = "<leader>j"
            -- }
            )
        end,
    },
    {
        "GCBallesteros/jupytext.nvim",
        config = function()
            require('jupytext').setup({})
        end
    },
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
        opts = function()
            local nn = require "notebook-navigator"

            local opts = { custom_textobjects = { h = nn.miniai_spec } }
            return opts
        end,
    },
    {
        "echasnovski/mini.hipatterns",
        dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
        opts = function()
            local nn = require "notebook-navigator"

            local opts = { highlighters = { cells = nn.minihipatterns_spec } }
            return opts
        end,
        config = function()
            local hipatterns = require('mini.hipatterns')
            hipatterns.setup({
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                }
            })
        end,
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        lazy = 'VeryLazy',
        branch = "regexp", -- This is the regexp branch, use this for the new version
        config = function()
            require("venv-selector").setup {
                settings = {
                    options = {
                        enable_default_searches = false,
                        debug = true,
                    },
                    search = {
                        my_venvs = {
                            command = "fdfind '/bin/python$' ~/Virtual-environments/ --full-path --color never -I",
                        }
                    }
                }
            }
        end,
        keys = {
            { ",v", "<cmd>VenvSelect<cr>" },
        },
    },
}
