return {
    {
        '3rd/image.nvim',
        event = "VeryLazy",
        enabled = function() return not vim.g.neovide end,
        opts = {
            backend = "kitty", -- whatever backend you would like to use
            max_width = 100,
            max_height = 12,
            max_width_window_percentage = math.huge,
            max_height_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ingore = { "cmp_menu", "cmp_docs", "" },
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = false,
                    only_render_image_at_cursor = false,
                    filetypes = { "markdown" },
                },
            },
        },
    },
    {
        "benlubas/molten-nvim",
        dependencies = { "image.nvim" },
        build = ":UpdateRemotePlugins",
        ft = 'python',
        keys = {
            { "<leader>mi",  "<cmd>MoltenInit<cr>",                   mode = 'n', ft = 'python', desc = '[M]olten [i]nit' },
            { "<leader>mdi", "<cmd>MoltenDeinit<cr>",                  mode = 'n', ft = 'python', desc = '[M]olten [d]e[i]nit' },
            { "<leader>mI",  "<cmd>MoltenInterrupt<cr>",              mode = 'n', ft = 'python', desc = '[M]olten [I]nterrupt' },
            { "<leader>mf",  "<cmd>MoltenImagePopup<cr>",             mode = 'n', ft = 'python', desc = '[M]olten [F]igure' },
            { "<leader>mc",  "<cmd>MoltenEvaluateCell<cr>",           mode = 'n', ft = 'python', desc = '[M]olten eval [C]ell' },
            { "<leader>mv",  "<cmd>MoltenEvaluateVisual<cr>",         mode = 'n', ft = 'python', desc = '[M]olten eval [V]isual' },
            { "<leader>mh",  "<cmd>MoltenHideOutput<cr>",             mode = 'n', ft = 'python', desc = '[M]olten [H]ide output' },
            { "<leader>ms",  "<cmd>MoltenShowOutput<cr>",             mode = 'n', ft = 'python', desc = '[M]olten [S]how output' },
            { "<leader>me",  "<cmd>:noautocmd MoltenEnterOutput<cr>", mode = 'n', ft = 'python', desc = '[M]olten [E]nter output' },
        },
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_auto_open_output = true
            vim.g.molten_wrap_output = true
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = true
            vim.g.molten_image_location = "float"
        end
    },
    {
        "GCBallesteros/NotebookNavigator.nvim",
        keys = {
            -- ]c / [c are also Neovim's diff-mode motions: keep those inside diff windows.
            {
                "]c",
                function()
                    if vim.wo.diff then
                        vim.cmd.normal { "]c", bang = true }
                    else
                        require("notebook-navigator").move_cell "d"
                    end
                end,
                ft = "python",
                desc = "next notebook [c]ell",
            },
            {
                "[c",
                function()
                    if vim.wo.diff then
                        vim.cmd.normal { "[c", bang = true }
                    else
                        require("notebook-navigator").move_cell "u"
                    end
                end,
                ft = "python",
                desc = "previous notebook [c]ell",
            },
        },
        dependencies = {
            "nvim-mini/mini.nvim",
            "benlubas/molten-nvim",
            "nvimtools/hydra.nvim",
        },
        event = "VeryLazy",
        config = function()
            local nn = require "notebook-navigator"
            nn.setup({})

            -- Notebook mode: <leader>j enters, cell and kernel keys stay active until <Esc>/q.
            local cmd = require("hydra.keymap-util").cmd
            require("hydra")({
                name = "Notebook",
                mode = "n",
                body = "<leader>j",
                hint = [[
 Cells                                   Kernel
 _j_/_k_: next/prev cell                   _i_: init        _I_: interrupt
 _l_: run cell    _s_: run + move          _o_: show output _h_: hide output
 _a_: run all     _d_: run below           _e_: enter output _f_: figure
 _n_: add below   _N_: add above           _D_: deinit
 _m_: merge down  _/_: split   _#_: comment
 ^ ^                       _q_/_<Esc>_: quit
]],
                config = {
                    color = "pink",
                    invoke_on_body = true,
                    hint = { type = "window", position = "bottom", show_name = true },
                },
                heads = {
                    { "j", function() nn.move_cell("d") end,      { desc = "next cell" } },
                    { "k", function() nn.move_cell("u") end,      { desc = "previous cell" } },
                    { "l", nn.run_cell,                           { desc = "run cell" } },
                    { "s", nn.run_and_move,                       { desc = "run cell and move" } },
                    { "a", nn.run_all_cells,                      { desc = "run all cells" } },
                    { "d", nn.run_cells_below,                    { desc = "run cells below" } },
                    { "n", nn.add_cell_below,                     { desc = "add cell below" } },
                    { "N", nn.add_cell_above,                     { desc = "add cell above" } },
                    { "m", function() nn.merge_cell("d") end,     { desc = "merge with cell below" } },
                    { "/", nn.split_cell,                         { desc = "split cell" } },
                    { "#", nn.comment_cell,                       { desc = "comment cell" } },
                    { "i", cmd "MoltenInit",                      { desc = "init kernel" } },
                    { "D", cmd "MoltenDeinit",                    { desc = "deinit kernel" } },
                    { "I", cmd "MoltenInterrupt",                 { desc = "interrupt" } },
                    { "o", cmd "MoltenShowOutput",                { desc = "show output" } },
                    { "h", cmd "MoltenHideOutput",                { desc = "hide output" } },
                    { "e", cmd "noautocmd MoltenEnterOutput",     { desc = "enter output" } },
                    { "f", cmd "MoltenImagePopup",                { desc = "figure popup" } },
                    { "q",     nil, { exit = true, nowait = true, desc = "quit" } },
                    { "<Esc>", nil, { exit = true, nowait = true, desc = "quit" } },
                },
            })
        end,
    },
    {
        "GCBallesteros/jupytext.nvim",
        config = function()
            require('jupytext').setup({})
        end
    },
    -- {
    --     "linux-cultist/venv-selector.nvim",
    --     dependencies = {
    --         "neovim/nvim-lspconfig",
    --         "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
    --     },
    --     event = 'VeryLazy',
    --     config = function()
    --         require("venv-selector").setup {
    --             settings = {
    --                 options = {
    --                     enable_default_searches = false,
    --                     debug = true,
    --                     log_level = 'debug',
    --                 },
    --                 search = {
    --                     my_venvs = {
    --                         command = "fdfind '/bin/python$' '/home/jeroensangers/Virtual-environments/' --full-path --color never -I",
    --                     }
    --                 }
    --             }
    --         }
    --     end,
    --     keys = {
    --         { ",v", "<cmd>VenvSelect<cr>" },
    --     },
    -- },
}
