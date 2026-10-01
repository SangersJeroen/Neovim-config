return {
    {
        "sustech-data/wildfire.nvim",
        opts = {
            surrounds = {
                { "(", ")" },
                { "{", "}" },
                { "<", ">" },
                { "[", "]" },
            },
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                node_decremental = "<BS>",
            },
            filetype_exclude = { "qf" }, --keymaps will be unset in excluding filetypes
        },
    },
    {
        "kylechui/nvim-surround",
        version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
}
