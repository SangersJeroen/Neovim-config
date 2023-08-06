lspconfig = require("lspconfig")
lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                black = { enabled = true },
                autopep8 = { enabled = true },
                yapf = { enabled = true },
                ruff = { enabled = true },
                pylint = { enabled = true, executable = "pylint" },
                pylsp_mypy = { enabled = true },
                pyls_isort = { enabled = true },
            },
        },
    },
    flags = {
        debounce_text_changes = 200,
    },
    capabilities = capabilities,
}
