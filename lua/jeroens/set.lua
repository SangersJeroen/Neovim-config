vim.opt.guicursor = "i:hor20-blinkwait100-blinkoff100-blinkon600,n:bar20-blinkwait100-blinkoff100-blinkon600"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "72,80,120"

vim.g.mapleader = " "

vim.g.codeium_disable_bindings = 1
vim.g.codeium_enabled = true
vim.g.codeium_manual = true
