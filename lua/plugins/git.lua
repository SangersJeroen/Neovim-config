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
}
