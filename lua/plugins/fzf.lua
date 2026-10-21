return { {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-mini/mini.nvim" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostics disable: missing-fields
    opts = {},
    ---@diagnostics enable: missing-fields
    config = function()
        local actions = require('fzf-lua').actions
        require('fzf-lua').register_ui_select()
        require('fzf-lua').setup({
            winopts = { preview = { default = "bat" } },
            keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } },
            actions = {
                files = {
                    ["enter"]  = actions.file_edit_or_qf,
                    ["ctrl-s"] = actions.file_split,
                    ["ctrl-v"] = actions.file_vsplit,
                    ["ctrl-t"] = actions.file_tabedit,
                    ["alt-q"]  = actions.file_sel_to_qf,
                }
            }
        })
    end,
    keys = {
        -- Finding Files
        {
            '<leader>ff',
            function() require('fzf-lua').files() end,
            desc = "[f]ind [f]iles"
        },
        {
            '<leader>gf',
            function()
                require('fzf-lua').git_files()
            end,
            desc = '[g]it [f]iles'
        },
        {
            '<leader>fw',
            function() require('fzf-lua').grep_cword() end,
            desc =
            '[f]ind [w]ord under cursor'
        },
        {
            '<leader>fg',
            function() require('fzf-lua').live_grep() end,
            desc =
            '[f]ind by [g]rep (live)'
        },
        -- Finding LSP related objects
        {
            '<leader>fr',
            function() require('fzf-lua').lsp_references() end,
            desc =
            '[f]ind [r]eferences'
        },
        {
            '<leader>fd',
            function() require('fzf-lua').lsp_declarations() end,
            desc = "[f]ind [d]eclaration"
        },
        {
            '<leader>fls',
            function() require('fzf-lua').lsp_document_symbols() end,
            desc = "[f]ind [l]sp [s]ymbols"
        },
        {
            '<leader>fldd',
            function() require('fzf-lua').diagnostics_document() end,
            desc = "[f]ind [l]sp [d]iagnostics, [d]ocument"
        },
        {
            '<leader>fldw',
            function() require('fzf-lua').diagnostics_workspace() end,
            desc = "[f]ind [l]sp [d]iagnostics, [w]orkspace"
        },
        {
            '<leader>flf',
            function() require('fzf-lua').lsp_finder() end,
            desc = "[f]ind [l]sp [f]inder"
        },
        -- DAP Breakpoints
        {
            '<leader>db',
            function() require('fzf-lua').dap_breakpoints() end,
            desc = "[d]ebugger [b]reakpoints"
        },
        {
            '<leader>dv',
            function() require('fzf-lua').dap_variables() end,
            desc = "[d]ebugger [v]ariables"
        },
        {
            '<C-p>',
            function() require('fzf-lua').keymaps() end,
            desc = 'command [p]alette (keymaps)'
        },
    }
} }
