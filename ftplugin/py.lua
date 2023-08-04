local lspconfig = require('lspconfig')
require 'lspconfig'.pylsp.setup {}

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true,
                    extendSelect = { "I" },
                },
                yapf = {
                    enabled = true,
                },
                mypy = {
                    enabled = false,
                },
            }
        }
    }
}
