local options = {
    create_keymappings = false,
    auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "mail",
        "markdown",
        "rst",
        "tex",
        "text",
    },
    auto_set_mode_heuristically = false
}

require("wrapping").setup(options)

vim.keymap.set("n", "<leader>w", '<cmd>HardWrapMode<CR>')
vim.keymap.set("n", "<leader>W", '<cmd>ToggleWrapMode<CR>')
