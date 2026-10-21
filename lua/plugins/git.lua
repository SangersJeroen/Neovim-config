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
            vim.keymap.set('n', ']h', function() gs.nav_hunk('next') end, { desc = 'next [h]unk' })
            vim.keymap.set('n', '[h', function() gs.nav_hunk('prev') end, { desc = 'previous [h]unk' })
        end
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle, { desc = 'toggle [U]ndotree' })
        end
    },
    {
        'isakbm/gitgraph.nvim',
        opts = {
            git_cmd = "git",
            format = {
                timestamp = '%H:%M:%S %d-%m-%Y',
                fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
            },
            symbols = {
                merge_commit = '',
                commit = '',
                merge_commit_end = '',
                commit_end = '',

                -- Advanced symbols
                GVER = '',
                GHOR = '',
                GCLD = '',
                GCRD = '╭',
                GCLU = '',
                GCRU = '',
                GLRU = '',
                GLRD = '',
                GLUD = '',
                GRUD = '',
                GFORKU = '',
                GFORKD = '',
                GRUDCD = '',
                GRUDCU = '',
                GLUDCD = '',
                GLUDCU = '',
                GLRDCL = '',
                GLRDCR = '',
                GLRUCL = '',
                GLRUCR = '',
            },
            hooks = {
                -- Check diff of a commit
                on_select_commit = function(commit)
                    require('diffview')
                    vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
                end,
                -- Check diff from commit a -> commit b
                on_select_range_commit = function(from, to)
                    require('diffview')
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
        opts = { integrations = { diffview = true, fzf_lua = true } },
        keys = {
            { "<leader>ng", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    },
    {
        'sindrets/diffview.nvim',
        lazy = true,
        cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>",              desc = "Diffview: working tree" },
            {
                "<leader>gb",
                function()
                    vim.ui.input({ prompt = "Base branch: ", default = "origin/main" }, function(base)
                        if base and base ~= "" then
                            vim.cmd("DiffviewOpen " .. base .. "...HEAD")
                        end
                    end)
                end,
                desc = "Diffview: branch vs base",
            },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>",     desc = "Diffview: file history" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<cr>",       desc = "Diffview: branch history" },
            { "<leader>gc", "<cmd>DiffviewClose<cr>",             desc = "Diffview: close" },
        },
        opts = {
            hooks = {
                diff_buf_read = function(bufnr)
                    -- Change local options in diff buffers
                    vim.opt_local.wrap = false
                    vim.opt_local.list = false
                    vim.opt_local.colorcolumn = { 80 }
                end,
                view_opened = function(view)
                    print(
                        ("A new %s was opened on tab page %d!")
                        :format(view.class:name(), view.tabpage)
                    )
                end,
            },
        },
    },
}
