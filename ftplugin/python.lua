vim.g.maplocalleader = '\\'
vim.keymap.set('v', '<localleader>sa', ":s/:[^,]*[, \\|*^)]/=,\\r/g<CR>", {desc='[s]ignature to [a]rguments call'})
