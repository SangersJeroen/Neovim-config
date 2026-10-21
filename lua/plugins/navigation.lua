return {
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        config = function()
            local harpoon = require("harpoon")

            vim.keymap.set('n', '<leader>a', function()
                harpoon:list():add()
            end, { desc = '[a]dd file to harpoon' })
            vim.keymap.set('n', '<C-e>', function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = 'harpoon m[e]nu' })
            vim.keymap.set('n', '<M-1>', function() harpoon:list():select(1) end, { desc = 'harpoon file [1]' })
            vim.keymap.set('n', '<M-2>', function() harpoon:list():select(2) end, { desc = 'harpoon file [2]' })
            vim.keymap.set('n', '<M-3>', function() harpoon:list():select(3) end, { desc = 'harpoon file [3]' })
            vim.keymap.set('n', '<M-4>', function() harpoon:list():select(4) end, { desc = 'harpoon file [4]' })
            vim.keymap.set('n', '<M-q>', function() harpoon:list():select(5) end, { desc = 'harpoon file [5]' })
            vim.keymap.set('n', '<M-w>', function() harpoon:list():select(6) end, { desc = 'harpoon file [6]' })
            vim.keymap.set('n', '<M-e>', function() harpoon:list():select(7) end, { desc = 'harpoon file [7]' })
            vim.keymap.set('n', '<M-r>', function() harpoon:list():select(8) end, { desc = 'harpoon file [8]' })
        end,
    },
    {
        'smoka7/hop.nvim',
        config = function()
            local hop = require('hop')
            local directions = require('hop.hint').HintDirection

            require 'hop'.setup {
                keys = 'asdfghjkl;qweruiopvncm',
                quit_key = '<Esc>',
                multi_windows = true,
            }

            vim.keymap.set('n', '<M-f>', function() hop.hint_words() end, { desc = 'hop to a word ([f]ind)' })
            vim.cmd('hi HopNextKey guifg=#cac911')
            vim.cmd('hi HopNextKey1 guifg=#ff06b5')
            vim.cmd('hi HopNextKey2 guifg=#01cac9')
        end,
    },
    {
        'smart-splits-nvim/smart-splits.nvim',
        version = '^3.0.0',
        lazy = false,
        opts = {
            move = {
                at_edge = 'split',
            },
            mux = {
                backend = 'smart-splits-backend-kitty',
            },
        },
        dependencies = {
            {
                'smart-splits-nvim/backend-kitty',
                dir = '/home/jeroensangers/Repos/backend-kitty',
                module = 'smart-splits-backend-kitty',
                opts = {
                    enable = true,

                    -- Remote-control password. When unset, falls back to
                    -- vim.g.smart_splits_kitty_password.
                    -- https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.remote_control_password
                    password = nil,

                    -- Which edges may create a Kitty split when move.at_edge is 'split'.
                    at_edge = 'split',
                    split = {
                        left = true,
                        right = true,
                        up = true,
                        down = true,
                    },

                    -- Kitty's stack layout is its zoom/fullscreen.
                    zoom = {
                        block_nav = false, -- refuse move and resize while the tab layout is 'stack'
                    },
                }
            }
        },
        config = function(_, opts)
            require('smart-splits').setup(opts)
            vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left, { desc = 'resize split left ([h])' })
            vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down, { desc = 'resize split down ([j])' })
            vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up, { desc = 'resize split up ([k])' })
            vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right, { desc = 'resize split right ([l])' })
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-h>', require('smart-splits').move_cursor_left, { desc = 'move to left split ([h])' })
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-l>', require('smart-splits').move_cursor_right, { desc = 'move to right split ([l])' })
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-j>', require('smart-splits').move_cursor_down, { desc = 'move to down split ([j])' })
            vim.keymap.set({ 'n', 'v', 'i' }, '<C-k>', require('smart-splits').move_cursor_up, { desc = 'move to up split ([k])' })
        end
    }
}
