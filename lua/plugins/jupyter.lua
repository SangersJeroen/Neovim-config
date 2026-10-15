return {
    {
        '3rd/image.nvim',
        event = "VeryLazy",
        enabled = function() return not vim.g.neovide end,
        opts = {
            backend = "kitty", -- whatever backend you would like to use
            max_width = 100,
            max_height = 12,
            max_width_window_percentage = math.huge,
            max_height_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ingore = { "cmp_menu", "cmp_docs", "" },
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
            { "<leader>mdi", "<cmd>MoltenDenit<cr>",                 mode = 'n', ft = 'python', desc = '[M]olten [d]e[i]nit' },
            { "<leader>mI", "<cmd>MoltenInterrupt<cr>",              mode = 'n', ft = 'python', desc = '[M]olten [I]nterrupt' },
            { "<leader>mf", "<cmd>MoltenImagePopup<cr>",             mode = 'n', ft = 'python', desc = '[M]olten [F]igure' },
            { "<leader>mc", "<cmd>MoltenEvaluateCell<cr>",           mode = 'n', ft = 'python', desc = '[M]olten eval [C]ell' },
            { "<leader>mv", "<cmd>MoltenEvaluateVisual<cr>",         mode = 'n', ft = 'python', desc = '[M]olten eval [V]isual' },
            { "<leader>mh", "<cmd>MoltenHideOutput<cr>",             mode = 'n', ft = 'python', desc = '[M]olten [H]ide output' },
            { "<leader>ms", "<cmd>MoltenShowOutput<cr>",             mode = 'n', ft = 'python', desc = '[M]olten [S]how output' },
            { "<leader>me", "<cmd>:noautocmd MoltenEnterOutput<cr>", mode = 'n', ft = 'python', desc = '[M]olten [E]nter output' },
        },
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
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
            "nvim-mini/mini.nvim",
            "benlubas/molten-nvim",
            "nvimtools/hydra.nvim",
        },
        event = "VeryLazy",
        config = function()
            local nn = require "notebook-navigator"
            nn.setup({})
            -- nn.setup({ activate_hydra_keys = "<leader>j" })
        end,
    },
    {
        "GCBallesteros/jupytext.nvim",
        config = function()
            require('jupytext').setup({})
        end
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
        },
        event = 'VeryLazy',
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
