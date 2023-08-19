lspconfig = require("lspconfig")
lspconfig.pylsp.setup {
    on_attach = custom_attach,
    settings = {
        pylsp = {
            plugins = {
                -- formatter options
                black = { enabled = true },
                autopep8 = { enabled = true },
                yapf = { enabled = true },
                ruff = { enabled = true },
                -- linter options
                pylint = { enabled = true, executable = "pylint" },
                -- type checker
                pylsp_mypy = { enabled = true },
                -- import sorting
                pyls_isort = { enabled = true },
            },
        },
    },
    flags = {
        debounce_text_changes = 200,
    },
    capabilities = capabilities,
}
--
-- require('lspconfig').ruff_lsp.setup {
--     on_attach = on_attach,
-- }
