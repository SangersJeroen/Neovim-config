local hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

Hop     =   require('hop')
Ssplits =   require('smart-splits')
Lsp     =   require('lsp-zero')

local directions = require('hop.hint').HintDirection

require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }


hydra({
    name = "Search Commands",
    mode = {"n", "v"},
    hint = [[
           🔍︎ SEARCH COMMANDS 🔍︎
^
_f_: FW Search 2 Char   _b_: BW Search 2 Char   _w_: Search word
^^
^ _q_/<Esc>: Exit
]],
    config = {
        color = 'teal',
        invoke_on_body = true,
        hint = {
            type = 'window',
            position = 'bottom',
            border = 'rounded',
        }
    },
    body = 's',
    heads = {
        {"f",      cmd 'lua Hop.hint_char2({direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = false})', {desc = "FWSearch 2Char", silent = true}},
        {"b",      cmd 'lua Hop.hint_char2({direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only=false})', {desc = "BWSearch 2Char", silent = true}},
        {"w",      cmd 'lua Hop.hint_words()', {desc = "Search Word", silent = true}},
        {"q",      nil, {desc = "quit", exit = true, nowait = true}},
        {"<Esc>",  nil, {desc = "quit", exit = true, nowait = true}}
    }
})


hydra({
    name = "Navigation Commands",
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
                                                 Navigation Commands
^
_<Left>_: Resize Window Left     _<Right>_: Resize Window Right     _<Up>_: Resize Window Up     _<Down>_: Resize Window Down
^
^ ^                                              _q_/_<Esc>_: Exit Hydra
        ]],
    body = "<C-Space>",
    heads = {
        {"<Left>",  cmd "lua Ssplits.resize_left()",  {desc = "Resize Pane/Window Left", silent = true}},
        {"<Right>", cmd "lua Ssplits.resize_right()", {desc = "Resize Pane/Window Right", silent = true}},
        {"<Up>",    cmd "lua Ssplits.resize_up()",    {desc = "Resize Pane/Window Up", silent = true}},
        {"<Down>",  cmd "lua Ssplits.resize_down()",  {desc = "Resize Pane/Window Down", silent = true}},
        {"q",       nil, {desc = "quit", exit = true, nowait = true}},
        {"<Esc>",   nil, {desc = "quit", exit = true, nowait = true}}
    }
})

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
_f_: Open Float         _._: Next Issue             _,_: Previous Issue
^
^^                      _q_/_<Esc>_: Exit Hydra
        ]],
    body = "<Space>f",
    heads = {
        {"r",     cmd "lua vim.lsp.buf.references()",  {desc = "Code References", silent = true}},
        {"n",     cmd "lua vim.lsp.buf.rename()",  {desc = "Code Rename", silent = true}},
        {"f",     cmd "lua vim.diagnostic.open_float()",  {desc = "Open Float", silent = true}},
        {".",     cmd "lua vim.diagnostic.goto_next()",  {desc = "Next", silent = true}},
        {",",     cmd "lua vim.diagnostic.goto_prev()",  {desc = "Previous", silent = true}},
        {"q",       nil, {desc = "quit", exit = true, nowait = true}},
        {"<Esc>",   nil, {desc = "quit", exit = true, nowait = true}}
    }
})

hydra({
    name = "Floaterm",
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
^                       Floaterm
_f_:Ranger              _p_:Python              _g_:Lazygit
^           _c_:Cht.sh              _t_:Terminal
^^
^                    _q_/_<Esc>_:quit
        ]],
    body = "<Space>t",
    heads = {
        {"f",     cmd "FloatermNew ranger",  {desc = "Ranger", silent = true}},
        {"p",     cmd "FloatermNew python",  {desc = "Python", silent = true}},
        {"g",     cmd "FloatermNew lazygit",  {desc = "Lazygit", silent = true}},
        {"c",     cmd "FloatermNew! cht.sh --shell",  {desc = "Cht.sh", silent = true}},
        {"t",     cmd "FloatermNew --cwd=<buffer>",  {desc = "Terminal Here", silent = true}},
        {"q",       nil, {desc = "quit", exit = true, nowait = true}},
        {"<Esc>",   nil, {desc = "quit", exit = true, nowait = true}}
    }
})
