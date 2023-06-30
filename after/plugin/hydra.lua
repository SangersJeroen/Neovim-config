local hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

Lsp     =   require('lsp-zero')

hydra({
    name = "LSP Commands",
    mode = {"n"},
    config = {
        color = "red",
        invoke_on_body = true,
        hint = {
            type = "window",
            position = "top",
            border = "rounded",
            show_name = true,
        }
    },
        hint = [[
^                       LSP Commands
        _r_: Code References        _n_: Code Rename
                      _f_: Open Float
^
^^                      _q_/_<Esc>_: Exit Hydra
        ]],
    body = "<Space>f",
    heads = {
        {"r",     cmd "lua vim.lsp.buf.references()",  {desc = "Code References", silent = true}},
        {"n",     cmd "lua vim.lsp.buf.rename()",  {desc = "Code Rename", silent = true}},
        {"f",     cmd "lua vim.diagnostic.open_float()",  {desc = "Open Float", silent = true}},
        {"q",       nil, {desc = "quit", exit = true, nowait = true}},
        {"<Esc>",   nil, {desc = "quit", exit = true, nowait = true}}
    }
})

hydra({
    name = "Floaterm",
    mode = {"n"},
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
        {"f",     cmd "FloatermNew ranger",  {desc = "Ranger", silent = true, nowait=true, exit_before=true}},
        {"p",     cmd "FloatermNew python",  {desc = "Python", silent = true, nowait=true, exit_before=true}},
        {"g",     cmd "FloatermNew lazygit",  {desc = "Lazygit", silent = true, nowait=true, exit_before=true}},
        {"c",     cmd "FloatermNew! cht.sh --shell",  {desc = "Cht.sh", silent = true, nowait=true, exit_before=true}},
        {"t",     cmd "FloatermNew --cwd=<buffer>",  {desc = "Terminal Here", silent = true, nowait=true, exit_before=true}},
        {"q",       nil, {desc = "quit", exit = true, nowait = true}},
        {"<Esc>",   nil, {desc = "quit", exit = true, nowait = true}}
    }
})
