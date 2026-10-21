-- Needs the `fzf` binary; the plugin stays unloaded on machines without it.
return { {
    "ibhagwan/fzf-lua",
    cond = function() return vim.fn.executable('fzf') == 1 end,
    config = function()
        local actions = require('fzf-lua').actions
        require('fzf-lua').register_ui_select()
        require('fzf-lua').setup({
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
        {
            '<leader>ff',
            function() require('fzf-lua').files() end,
            desc = "[f]ind [f]iles"
        },
        {
            '<leader>fw',
            function() require('fzf-lua').grep_cword() end,
            desc = '[f]ind [w]ord under cursor'
        },
        {
            '<leader>fg',
            function() require('fzf-lua').live_grep() end,
            desc = '[f]ind by [g]rep (live)'
        },
        {
            '<C-p>',
            function() require('fzf-lua').keymaps() end,
            desc = 'command [p]alette (keymaps)'
        },
    }
} }
