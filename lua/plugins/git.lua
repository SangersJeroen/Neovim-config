return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
            local gs = package.loaded.gitsigns
            vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = '[h]unk [s]tage' })
            vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = '[h]unk [r]eset' })
            vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = '[h]unk [s]tage selection' })
            vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = '[h]unk [r]eset selection' })
            vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { desc = '[h]unk stage buffer ([S])' })
            vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = '[h]unk [u]ndo stage' })
            vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { desc = '[h]unk reset buffer ([R])' })
            vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = '[h]unk [p]review' })
            vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = '[h]unk [b]lame (full)' })
            vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[t]oggle line [b]lame' })
            vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = '[h]unk [d]iff against index' })
            vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { desc = '[h]unk [D]iff against last commit' })
            vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { desc = '[t]oggle [d]eleted lines' })
            vim.keymap.set('n', ']h', function() gs.nav_hunk('next') end, { desc = 'next [h]unk' })
            vim.keymap.set('n', '[h', function() gs.nav_hunk('prev') end, { desc = 'previous [h]unk' })
        end
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, { desc = '[t]oggle [u]ndotree' })
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
                desc = "[g]it [l]og graph",
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
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "[g]it Neo[g]it UI" }
        }
    },
    {
        'sindrets/diffview.nvim',
        lazy = true,
        cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>",              desc = "[g]it [d]iff working tree" },
            {
                "<leader>gb",
                function()
                    vim.ui.input({ prompt = "Base branch: ", default = "origin/main" }, function(base)
                        if base and base ~= "" then
                            vim.cmd("DiffviewOpen " .. base .. "...HEAD")
                        end
                    end)
                end,
                desc = "[g]it diff [b]ranch vs base",
            },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>",     desc = "[g]it file [h]istory" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<cr>",       desc = "[g]it branch [H]istory" },
            { "<leader>gc", "<cmd>DiffviewClose<cr>",             desc = "[g]it diff [c]lose" },
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
