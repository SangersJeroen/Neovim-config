return { {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostics disable: missing-fields
    opts = {},
    ---@diagnostics enable: missing-fields
    config = function()
        actions = require('fzf-lua').actions
        require('fzf-lua').setup({
            winopts = { preview = { default = "bat" } },
            keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } },
            actions = {
                files = {
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
            desc = "Find Files"
        },
        {
            '<C-p>ff',
            function()
                require('fzf-lua').git_files()
            end,
            desc = 'Find Git Files'
        },
        {
            '<leader>fw',
            function() require('fzf-lua').grep_cword() end,
            desc =
            'Find Word (under cursor)'
        },
        {
            '<leader>fg',
            function() require('fzf-lua').live_grep() end,
            desc =
            'Live Search'
        },
        -- Finding LSP related objects
        {
            '<leader>fr',
            function() require('fzf-lua').lsp_references() end,
            desc =
            'Find References'
        },
        {
            '<leader>fd',
            function() require('fzf-lua').lsp_declarations() end,
            desc = "Find Declaration"
        },
        {
            '<leader>fls',
            function() require('fzf-lua').lsp_document_symbols() end,
            desc = "Find LSP Diag. Doc"
        },
        {
            '<leader>fldd',
            function() require('fzf-lua').diagnostics_document() end,
            desc = "Find LSP Diag. Doc"
        },
        {
            '<leader>fldw',
            function() require('fzf-lua').diagnostics_workspace() end,
            desc = "Find LSP Diag. WSpace"
        },
        {
            '<leader>flf',
            function() require('fzf-lua').lsp_finder() end,
            desc = "Finder LSP"
        },
        -- DAP Breakpoints
        {
            '<leader>fbp',
            function() require('fzf-lua').dap_breakpoints() end,
            desc = "Find DAP Breakp."
        },
        {
            '<leader>fdv',
            function() require('fzf-lua').dap_variables() end,
            desc = "Find DAP Var."
        },
    }
} }
