local hop = require('hop')
local directions = require('hop.hint').HintDirection

require'hop'.setup {
    keys = 'etovxqpdygfblzhckisuran',
    quit_key = ' <SPC>',
    multi_windows = true,
}

vim.keymap.set('n', '<M-f>', function() hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false }) end)
vim.keymap.set('n', '<M-F>', function() hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end)
vim.keymap.set('n', '<M-w>', function() hop.hint_words() end)
