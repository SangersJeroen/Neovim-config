return {
    {
        "gbprod/substitute.nvim",
        config = function()
            -- Lua
            require('substitute').setup()
            subs = require('substitute')
            ssex = require('substitute.exchange')
            vim.keymap.set("n", "s", subs.operator, { noremap = true })
            vim.keymap.set("n", "ss", subs.line, { noremap = true })
            vim.keymap.set("n", "S", subs.eol, { noremap = true })
            vim.keymap.set("x", "s", subs.visual, { noremap = true })
            vim.keymap.set("n", "sx", ssex.operator, { noremap = true })
            vim.keymap.set("n", "sxx", ssex.line, { noremap = true })
            vim.keymap.set("x", "X", ssex.visual, { noremap = true })
            vim.keymap.set("n", "sxc", ssex.cancel, { noremap = true })
        end
    },
}
