return {
    {
        '3rd/image.nvim',
        event = "VeryLazy",
        opts = {
            backend = "kitty", -- whatever backend you would like to use
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
    },
    {
        "benlubas/molten-nvim",
        dependencies = { "image.nvim" },
        build = ":UpdateRemotePlugins",
        event = "VeryLazy",
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.moltend_output_win_max_height = 20
            -- I find auto open annoying, keep in mind setting this option will require setting
            -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
            vim.g.molten_auto_open_output = false

            -- optional, I like wrapping. works for virt text and the output window
            vim.g.molten_wrap_output = true

            -- Output as virtual text. Allows outputs to always be shown, works with images, but can
            -- be buggy with longer images
            vim.g.molten_virt_text_output = true

            -- this will make it so the output shows up below the \`\`\` cell delimiter
            vim.g.molten_virt_lines_off_by_1 = true
        end
    },
    {
        "GCBallesteros/NotebookNavigator.nvim",
        keys = {
            { "]h",        function() require("notebook-navigator").move_cell "d" end },
            { "[h",        function() require("notebook-navigator").move_cell "u" end },
            { "<leader>a", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
            { "<leader>A", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
        },
        dependencies = {
            "echasnovski/mini.comment",
            "benlubas/molten-nvim",
            "anuvyklack/hydra.nvim",
        },
        event = "VeryLazy",
        config = function()
            local nn = require "notebook-navigator"
            nn.setup({ activate_hydra_keys = "<leader>j" })
        end,
    },
    {
        "GCBallesteros/jupytext.nvim",
    },
    {
        "echasnovski/mini.hipatterns",
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
    }
}
