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
        end,
    }
}
