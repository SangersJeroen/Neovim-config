-- mini.comment is set up in mini.lua together with the other mini.* modules.
return {
    {
        "danymat/neogen",
        event = "VeryLazy",
        config = function()
            require('neogen').setup(
                {
                    enabled = true,
                    snippet_engine = 'luasnip',
                    input_after_comment = true,
                    languages = {
                        ['python.numpydoc'] = require('neogen.configurations.python')
                    }
                }
            )
            vim.keymap.set('n', '<leader>g', ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })
        end,
        keys = {
            { '<leader>g', desc = 'Neogen generate docs' }
        }
    }
}
