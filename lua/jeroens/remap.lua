vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc='Carry line down'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc='Carry line up'})

vim.keymap.set("n", "<leader>fb", vim.cmd.Ex, {desc='[f]ile [b]rowser'})

vim.keymap.set("n", "<C-D>", "<C-d>zz", {desc='half page [D]own, centred'})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc='half page [u]p, centred'})

vim.keymap.set("n", "n", "nzzzv", {desc='[n]ext match, centred'})
vim.keymap.set("n", "N", "Nzzzv", {desc='previous match ([N]), centred'})

vim.keymap.set("x", "<leader>p", "\"_dP", {desc='[p]aste over selection, keep register'})

-- # Yank to special buffer

-- # Yank to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y", {desc='[y]ank to system clipboard'})
-- # Paste from system clipboard
vim.keymap.set("n", "<leader>P", '"+p', {desc='[P]aste from system clipboard'})

-- # Toggle Wrap
vim.keymap.set("n", "<leader>tw", '<cmd>set wrap!<CR>', {desc='[t]oggle [w]rap'})


vim.keymap.set("n", "j", "gj", {desc='down by display line ([j])'})
vim.keymap.set("n", "k", "gk", {desc='up by display line ([k])'})

vim.keymap.set('n', '<M-v>', '<cmd>vsplit<CR>', {desc='split [v]ertical'})
vim.keymap.set('n', '<M-s>', '<cmd>split<CR>', {desc='split horizontal ([s])'})

vim.keymap.set('i', 'jk', '<Esc>', {desc='leave insert mode ([j][k])'})

vim.keymap.set('v', '<leader>sa', ":s/:[^,]*[, \\|*^)]/=,\\r/g", {desc='[s]ignature to [a]rguments call'})

-- Declare a function to toggle diagnostics
function ToggleDiagnostics()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

vim.keymap.set("n", "<leader>tt", "<cmd>lua ToggleDiagnostics()<CR>", {desc='[t]oggle diagnostics ([t])', noremap = true, silent = true })
