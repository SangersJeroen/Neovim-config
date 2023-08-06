lspconfig = require("lspconfig")
lspconfig.pylsp.setup {
    on_attach = custom_attach,
    settings = {
        pylsp = {
            plugins = {
                -- formatter options
                black = { enabled = true },
                autopep8 = { enabled = false },
                yapf = { enabled = true },
                ruff = { enabled = true },
                -- linter options
                pylint = { enabled = true, executable = "pylint" },
                -- type checker
                pylsp_mypy = { enabled = false },
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
