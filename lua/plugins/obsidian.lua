return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        ft = "markdown",
        ---@module 'obsidian'
        ---@type obsidian.config
        opts = {
            legacy_commands = false,
        },
        config = function()
            require("obsidian").setup({
                notes_subdir = "modica",
                workspaces = {
                    {
                        name = "Shard",
                        path = "~/Shard",
                    },
                },
            })
            local hydra = require("hydra")
            local cmd = require("hydra.keymap-util").cmd

            hydra({
                name = "Obsidian",
                mode = { "n" },
                config = {
                    color = "teal",
                    invoke_on_body = true,
                    hint = {
                        type = "window",
                        positions = "top",
                        border = "rounded",
                        show_name = true,
                    }
                },
                hint = [[
^                Obsidian Note:             ^
^                                           ^
^       _t_: Today's       _n_: New         ^
^       _y_: Yesterday's   _s_: Search      ^
^       _T_: Tomorrow's    _f_: Template Ins^
^                                           ^
^               _q_/_<Esc>_: Quit           ^
            ]],
                body = "<Space>o",
                heads = {
                    { "t",     cmd "ObsidianToday",     { desc = "Today's Note", nowait = true, exit_before = true } },
                    { "y",     cmd "ObsidianYesterday", { desc = "Yesterday's Note", nowait = true, exit_before = true } },
                    { "T",     cmd "ObsidianTomorrow",  { desc = "Tomorrow's Note", nowait = true, exit_before = true } },
                    { "n",     cmd "ObsidianNew",       { desc = "New Note", nowait = true, exit_before = true } },
                    { "s",     cmd "ObsidianSearch",    { desc = "Search Notes", nowait = true, exit_before = true } },
                    { "f",     cmd "ObsidianTemplate",  { desc = "Insert Template", nowait = true, exit_before = true } },
                    { "q",     nil,                     { desc = "quit", exit = true, nowait = true, exit_before = true } },
                    { "<Esc>", nil,                     { desc = "quit", exit = true, nowait = true, exit_before = true } },
                }
            })
        end
    },
}
