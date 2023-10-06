local hydra = require("hydra")
local cmd   = require("hydra.keymap-util").cmd


hydra({
    name = "Floaterm",
    mode = { "n" },
    config = {
        color = "teal",
        invoke_on_body = true,
        hint = {
            type = "window",
            position = "top",
            border = "rounded",
            show_name = true,
        }
    },
    hint = [[
^                       Floaterm
_f_:Ranger              _p_:Python              _g_:Lazygit
^           _c_:Cht.sh              _t_:Terminal
^^
^                    _q_/_<Esc>_:quit
        ]],
    body = "<Space>t",
    heads = {
        { "f",     cmd "FloatermNew ranger",          { desc = "Ranger", silent = true, nowait = true, exit_before = true } },
        { "p",     cmd "FloatermNew python",          { desc = "Python", silent = true, nowait = true, exit_before = true } },
        { "g",     cmd "FloatermNew lazygit",         { desc = "Lazygit", silent = true, nowait = true, exit_before = true } },
        { "c",     cmd "FloatermNew! cht.sh --shell", { desc = "Cht.sh", silent = true, nowait = true, exit_before = true } },
        { "t",     cmd "FloatermNew --cwd=<buffer>",
                                                          { desc = "Terminal Here", silent = true, nowait = true,
                exit_before = true } },
        { "q",     nil,                               { desc = "quit", exit = true, nowait = true } },
        { "<Esc>", nil,                               { desc = "quit", exit = true, nowait = true } }
    }
})
