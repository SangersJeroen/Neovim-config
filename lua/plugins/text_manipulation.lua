return {
    {
        "sustech-data/wildfire.nvim",
        config = function()
            opts = {
                {
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
                }
            }
            require("wildfire").setup(opts)
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
}
