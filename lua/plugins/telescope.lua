return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'debugloop/telescope-undo.nvim'
    },
    cmd = "Telescope",
    keys = {
        {
            '<leader>ff',
            function() require('telescope.builtin').find_files() end,
            desc =
            'Find Files'
        },
        {
            '<C-p>ff',
            function() require('telescope.builtin').git_files() end,
            desc =
            'Find Git Files'
        },
        {
            '<leader>fw',
            function() require('telescope.builtin').grep_string({vim.fn.expand("<cword>")}); end,
            desc =
            'Find word under cursors'
        },
        {
            '<leader>fs',
            function() require('telescope.builtin').grep_string({ search = vim.fn.input("Query: ") }); end,
            desc =
            'Find in Files'
        },
        {
            '<leader>fg',
            function() require('telescope.builtin').live_grep(); end,
            desc =
            'Live Search'
        },
        {
            '<leader>:',
            function() require('telescope.builtin').command_history() end,
            desc =
            'Find Files'
        },
        {
            "<M-u>",
            "<cmd>Telescope undo<cr>",
            desc =
            'Search Changes'
        },
    },
    config = function()
        require("telescope").load_extension("undo")
        require("telescope").setup({
            extensions = {
                undo = {
                    use_delta = true,
                    use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
                    side_by_side = false,
                    diff_context_lines = vim.o.scrolloff,
                    entry_format = "state #$ID, $STAT, $TIME",
                    time_format = "",
                    mappings = {
                        i = {
                            -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                            -- you want to replicate these defaults and use the following actions. This means
                            -- installing as a dependency of telescope in it's `requirements` and loading this
                            -- extension from there instead of having the separate plugin definition as outlined
                            -- above.
                            ["<cr>"] = require("telescope-undo.actions").yank_additions,
                            ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                        },
                    },
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    }
                },
            },
        })
    end
}
