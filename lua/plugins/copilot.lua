return {
    {
        "github/copilot.vim",
        config = function()
            vim.cmd("Copilot disable")
            vim.keymap.set('i', '<M-a>', 'copilot#Accept("\\<CR>")',
                {
                    expr = true,
                    replace_leycodes = false
                })
            vim.g.copilot_no_tab_map = true
        end
    },
}
