vim.g.maplocalleader = '\\'
vim.keymap.set('v', '<localleader>sa', ":s/:[^,]*[, \\|*^)]/=,\\r/g<CR>")
