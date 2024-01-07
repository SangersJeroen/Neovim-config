return {
    {
        'echasnovski/mini.comment',
        config = function()
            require('mini.splitjoin').setup()
            require('mini.comment').setup()
            require('mini.starter').setup()
        end,
    }
}
