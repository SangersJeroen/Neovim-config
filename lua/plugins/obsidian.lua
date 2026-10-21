return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        ft = "markdown",
        lazy=false,
        ---@module 'obsidian'
        config = function()
            require("obsidian").setup({
                notes_subdir = "modica",
                ui = {enable = false},
                legacy_commands = false,
                picker = { name = "fzf-lua" },
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
                        position = "top",
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
                body = "<leader>o",
                heads = {
                    { "t",     cmd "Obsidian today",     { desc = "Today's Note", nowait = true, exit_before = true } },
                    { "y",     cmd "Obsidian yesterday", { desc = "Yesterday's Note", nowait = true, exit_before = true } },
                    { "T",     cmd "Obsidian tomorrow",  { desc = "Tomorrow's Note", nowait = true, exit_before = true } },
                    { "n",     cmd "Obsidian new",       { desc = "New Note", nowait = true, exit_before = true } },
                    { "s",     cmd "Obsidian search",    { desc = "Search Notes", nowait = true, exit_before = true } },
                    { "f",     cmd "Obsidian template",  { desc = "Insert Template", nowait = true, exit_before = true } },
                    { "q",     nil,                     { desc = "quit", exit = true, nowait = true, exit_before = true } },
                    { "<Esc>", nil,                     { desc = "quit", exit = true, nowait = true, exit_before = true } },
                }
            })
        end
    },
}
