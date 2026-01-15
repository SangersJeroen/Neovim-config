return {
    {
        'theprimeagen/harpoon',
        config = function()
            local mark = require('harpoon.mark')
            local ui = require('harpoon.ui')

            vim.keymap.set('n', '<leader>a', mark.add_file)
            vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

            vim.keymap.set('n', '<M-1>', function() ui.nav_file(1) end)
            vim.keymap.set('n', '<M-2>', function() ui.nav_file(2) end)
            vim.keymap.set('n', '<M-3>', function() ui.nav_file(3) end)
            vim.keymap.set('n', '<M-4>', function() ui.nav_file(4) end)
            vim.keymap.set('n', '<M-q>', function() ui.nav_file(5) end)
            vim.keymap.set('n', '<M-w>', function() ui.nav_file(6) end)
            vim.keymap.set('n', '<M-e>', function() ui.nav_file(7) end)
            vim.keymap.set('n', '<M-r>', function() ui.nav_file(8) end)
        end,
    },
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            local hop = require('hop')
            local directions = require('hop.hint').HintDirection

            require 'hop'.setup {
                keys = 'asdfghjkl;qweruiopvncm',
                -- keys = 'etovxqpdygfblzhckisuran',
                quit_key = ' <SPC>',
                multi_windows = true,
            }

            vim.keymap.set('n', '<M-f>', function() hop.hint_words() end)
            vim.cmd('hi HopNextKey guifg=#cac911')
            vim.cmd('hi HopNextKey1 guifg=#01cac9')
            vim.cmd('hi HopNextKey2 guifg=#ff06b5')
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        config = function()
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-h>', "<cmd> TmuxNavigateLeft<CR>")
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-l>', "<cmd> TmuxNavigateRight<CR>")
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-j>', "<cmd> TmuxNavigateDown<CR>")
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-k>', "<cmd> TmuxNavigateUp<CR>")
        end,
    },
}
