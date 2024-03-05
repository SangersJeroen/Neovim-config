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

vim.opt.scrolloff = 999
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "72,80,120"

vim.g.mapleader = " "

vim.g.codeium_disable_bindings = 1
vim.g.codeium_enabled = true
vim.g.codeium_manual = true

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

if vim.g.neovide then
    vim.o.guifont = "CaskaydiaCove NFM"
    vim.opt.linespace = 4
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    vim.g.neovide_scroll_animation_length = 0.15
    vim.g.neovide_scroll_animation_far_lines = 0
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_scale_factor = 0.75
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-+>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.25)
    end)
end
