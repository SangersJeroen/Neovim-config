-- All mini.* modules come from the single mini.nvim repo.
-- Other specs should depend on "nvim-mini/mini.nvim", never on individual mini.* repos.
return {
    {
        "nvim-mini/mini.nvim",
        lazy = false,
        config = function()
            require('mini.icons').setup()
            require('mini.statusline').setup()
            require('mini.comment').setup()
            require('mini.splitjoin').setup()

            -- NotebookNavigator provides the `h` (cell) textobject and cell highlighting.
            -- Requiring it here lets lazy.nvim load it on demand.
            local nn = require("notebook-navigator")

            require('mini.ai').setup({
                custom_textobjects = { h = nn.miniai_spec },
            })

            local hipatterns = require('mini.hipatterns')
            hipatterns.setup({
                highlighters = {
                    cells     = nn.minihipatterns_spec,

                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
        end,
    },
}
