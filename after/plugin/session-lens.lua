require('session-lens').setup {
    path_display = {'shorten'},
    theme = 'ivy'
}

vim.keymap.set("n", "<c-s>", '<cmd>SearchSession<CR>')
