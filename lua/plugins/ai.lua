return {
    {
        'Exafunction/codeium.vim',
        config = function()
            vim.keymap.set('i', '<C-c>', function() return vim.fn["codeium#Complete"]() end, { expr = true })
            vim.keymap.set('i', '<M-a>', function() return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<M-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<M-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#Clear']() end, { expr = true })
            vim.keymap.set('n', '<M-c>', function() return vim.fn['codeium#Chat']() end, { expr = true })
        end,
    }
}
