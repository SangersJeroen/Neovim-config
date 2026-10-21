return {
    {
        'Exafunction/codeium.vim',
        config = function()
            vim.keymap.set('i', '<C-c>', function() return vim.fn["codeium#Complete"]() end, { expr = true, desc = 'codeium [c]omplete' })
            vim.keymap.set('i', '<M-a>', function() return vim.fn['codeium#Accept']() end, { expr = true, desc = 'codeium [a]ccept' })
            vim.keymap.set('i', '<M-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, desc = 'codeium next suggestion ([j])' })
            vim.keymap.set('i', '<M-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, desc = 'codeium previous suggestion ([k])' })
            vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#Clear']() end, { expr = true, desc = 'codeium clear ([h])' })
            vim.keymap.set('n', '<M-c>', function() return vim.fn['codeium#Chat']() end, { expr = true, desc = 'codeium [c]hat' })
        end,
    }
}
