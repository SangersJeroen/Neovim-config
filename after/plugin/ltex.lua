require("lspconfig").ltex.setup {
    capabilities = your_capabilities,
    on_attach = function(client, bufnr)
        -- your other on_attach functions.
        require("ltex_extra").setup{
            load_langs = { "en-GB", "en-US" }, -- table <string> : languages for witch dictionaries will be loaded
            init_check = true, -- boolean : whether to load dictionaries on startup
            path = os.getenv("HOME").."/.config/nvim/spell", -- string : path to store dictionaries. Relative path uses current working directory
            log_level = "none", -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
        }
    end,
    settings = {
        ltex = {
            checkFrequency = "edit",
            language = "en-GB"
        }
    }
}
