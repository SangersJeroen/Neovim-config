local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('jeroens')
require('plugins')

vim.o.encoding = 'UTF-8'
vim.opt.conceallevel = 2
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup('plugins')
