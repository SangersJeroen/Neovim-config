require('mini.files').setup()
require('mini.splitjoin').setup()
require('mini.comment').setup()
require('mini.starter').setup()

vim.keymap.set('n', '<M-o>', function() MiniFiles.open() end)
