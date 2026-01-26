return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
            local gs = package.loaded.gitsigns
            vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = 'stage chunk' })
            vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = 'reset chunk' })
            vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = 'stage selected' })
            vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = 'reset selected' })
            vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { desc = 'stage file' })
            vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage' })
            vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { desc = 'reset file' })
            vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = 'preview chunk' })
            vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'full blame' })
            vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle blame' })
            vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = 'diff this' })
            vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'diff this' })
            vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { desc = 'show deleted' })
        end
    },
    {
        "jiaoshijie/undotree",
        ---@module 'undotree.collector'
        ---@type UndoTreeCollector.Opts
        config = function()
            local ut = require('undotree')
            ut.setup({
                float_diff = true,
                position = 'left',
                ignore_filetype = {
                    'undotree',
                    'undotreeDiff',
                    'qf',
                },
                window = {
                    winblend = 0,
                    border = 'rounded',
                },
            })
        end,
        keys = { -- load the plugin only when using it's keybinding:
            { "<leader>U", "<cmd>lua require('undotree').toggle()<cr>" },
        },
    },
    {
        'isakbm/gitgraph.nvim',
        opts = {
            git_cmd = "git",
            symbols = {
                merge_commit = 'M',
                commit = '*',
            },
            format = {
                timestamp = '%H:%M:%S %d-%m-%Y',
                fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
            },
            hooks = {
                on_select_commit = function(commit)
                    print('selected commit:', commit.hash)
                end,
                on_select_range_commit = function(from, to)
                    print('selected range:', from.hash, to.hash)
                end,
                -- Check diff of a commit
                on_select_commit = function(commit)
                    vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
                end,
                -- Check diff from commit a -> commit b
                on_select_range_commit = function(from, to)
                    vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
                end,
            },
        },
        keys = {
            {
                "<leader>gl",
                function()
                    require('gitgraph').draw({}, { all = true, max_count = 5000 })
                end,
                desc = "GitGraph - Draw",
            },
        },
    },
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "ibhagwan/fzf-lua",
        },
        cmd = "Neogit",
        keys = {
            { "<leader>ng", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    }
}
