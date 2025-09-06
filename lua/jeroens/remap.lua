vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-D>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- # Yank to special buffer

-- # Yank to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
-- # Paste from system clipboard
vim.keymap.set("n", "<leader>P", '"+p')

-- # Quit current buffer
vim.keymap.set("n", "<leader>C", '<cmd>q<CR>')

-- # Toggle Wrap
vim.keymap.set("n", "<leader>W", '<cmd>set wrap!<CR>')


vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set('n', '<M-v>', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<M-s>', '<cmd>split<CR>')

vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('v', '<leader>sa', ":s/:[^,]*[, \\|*^)]/=,\\r/g")

-- Declare a function to toggle diagnostics
function ToggleDiagnostics()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.disable()
  else
    vim.diagnostic.enable()
  end
end

vim.keymap.set("n", "<leader>tt", "<cmd>lua ToggleDiagnostics()<CR>", { noremap = true, silent = true })
