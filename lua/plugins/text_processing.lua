return {
    {
        "gbprod/substitute.nvim",
        config = function()
            -- Lua
            require('substitute').setup()
            local subs = require('substitute')
            local ssex = require('substitute.exchange')
            vim.keymap.set("n", "s", subs.operator, { noremap = true, desc = '[s]ubstitute with register (operator)' })
            vim.keymap.set("n", "ss", subs.line, { noremap = true, desc = '[s]ubstitute line' })
            vim.keymap.set("n", "S", subs.eol, { noremap = true, desc = '[S]ubstitute to end of line' })
            vim.keymap.set("x", "s", subs.visual, { noremap = true, desc = '[s]ubstitute selection' })
            vim.keymap.set("n", "sx", ssex.operator, { noremap = true, desc = 'e[x]change (operator)' })
            vim.keymap.set("n", "sxx", ssex.line, { noremap = true, desc = 'e[x]change line' })
            vim.keymap.set("x", "X", ssex.visual, { noremap = true, desc = 'e[X]change selection' })
            vim.keymap.set("n", "sxc", ssex.cancel, { noremap = true, desc = 'e[x]change [c]ancel' })
        end
    },
}
