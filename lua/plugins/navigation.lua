return {
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        config = function()
            local harpoon = require("harpoon")

            vim.keymap.set('n', '<leader>a', function()
                harpoon:list():add()
            end)
            vim.keymap.set('n', '<C-e>', function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)
            vim.keymap.set('n', '<M-1>', function() harpoon:list():select(1) end)
            vim.keymap.set('n', '<M-2>', function() harpoon:list():select(2) end)
            vim.keymap.set('n', '<M-3>', function() harpoon:list():select(3) end)
            vim.keymap.set('n', '<M-4>', function() harpoon:list():select(4) end)
            vim.keymap.set('n', '<M-q>', function() harpoon:list():select(5) end)
            vim.keymap.set('n', '<M-w>', function() harpoon:list():select(6) end)
            vim.keymap.set('n', '<M-e>', function() harpoon:list():select(7) end)
            vim.keymap.set('n', '<M-r>', function() harpoon:list():select(8) end)
        end,
    },
    {
        'smoka7/hop.nvim',
        config = function()
            local hop = require('hop')
            local directions = require('hop.hint').HintDirection

            require 'hop'.setup {
                keys = 'asdfghjkl;qweruiopvncm',
                -- keys = 'etovxqpdygfblzhckisuran',
                quit_key = ' <ESC>',
                multi_windows = true,
            }

            vim.keymap.set('n', '<M-f>', function() hop.hint_words() end)
            vim.cmd('hi HopNextKey guifg=#cac911')
            vim.cmd('hi HopNextKey1 guifg=#ff06b5')
            vim.cmd('hi HopNextKey2 guifg=#01cac9')
        end,
    },
    {
        'mrjones2014/smart-splits.nvim',
        lazy=false,
        opts = {
            mux = {
                backend = 'smart-splits-backend-kitty',
            },
        },
        dependencies={
            {
                'smart-splits-nvim/backend-kitty',
                module = 'smart-splits-backend-kitty',
            }
        },
        config = function()
            local ss = require('smart-splits')
            vim.keymap.set('n', '<A-h>', ss.resize_left)
            vim.keymap.set('n', '<A-j>', ss.resize_down)
            vim.keymap.set('n', '<A-k>', ss.resize_up)
            vim.keymap.set('n', '<A-l>', ss.resize_right)
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-h>', ss.move_cursor_left)
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-l>', ss.move_cursor_right)
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-j>', ss.move_cursor_down)
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-k>', ss.move_cursor_up)
        end
    }
}
