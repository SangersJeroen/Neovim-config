-- PYTHON LANGUAGE SERVERS CONFIGURATION ________________________________________________________
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(event)
        local bufopts = { buffer = event.buf }
        vim.keymap.set("i", "xgs", function() vim.lsp.buf.signature_help() end, bufopts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, bufopts)

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, bufopts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, bufopts)
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, bufopts)
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, bufopts)

        vim.keymap.set("n", "<Space>c", function() vim.diagnostic.goto_prev() end, bufopts)
        vim.keymap.set("n", "<Space>v", function() vim.diagnostic.goto_next() end, bufopts)
        vim.keymap.set("n", "<C-x>", function() vim.lsp.buf.code_action() end, bufopts)

        vim.keymap.set('n', '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, bufopts)
        vim.keymap.set('n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, bufopts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)

        vim.keymap.set('n', '<space>D', function() vim.lsp.buf.type_definition() end, bufopts)
        vim.keymap.set('n', '<space>rn', function() vim.lsp.buf.rename() end, bufopts)
        vim.keymap.set('n', '<M-p>', function() vim.lsp.buf.format() end, bufopts)
    end
})


-- LUA
lspconfig.lua_ls.setup({
    capabilities = lsp_capabilities,
    on_attach = on_attach,
})


-- PYTHON
-- lspconfig.ruff_lsp.setup({
--     capabilities = lsp_capabilities,
--     on_attach = on_attach,
-- })

-- lspconfig.pylyzer.setup({
--     capabilities = lsp_capabilities,
--     on_attach = on_attach,
-- })

lspconfig.pylsp.setup {
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                -- formatter options
                black = { enabled = true },
                -- linter options
                pylint = { enabled = true, executable = "pylint" },
                -- type checker
                pylsp_mypy = { enabled = true },
                -- auto-completion options
                pyls_isort = { enabled = true },
                -- linter
                ruff = {
                    enabled = true,
                    lineLength = 120,
                },
            },
        },
    },
    flags = {
        debounce_text_changes = 200,
    },
    capabilities = lsp_capabilities,
}


-- LaTeX LANGUAGE SERVERS CONFIGURATION
require("lspconfig").ltex.setup {
    capabilities = lsp_capabilities,
    on_attach = function(client, bufnr)
        require("ltex_extra").setup {
            load_langs = { "en-GB", "en-US", "nl-NL" },
            init_check = true,
            path = os.getenv("HOME") .. "/.config/nvim/spell",
            log_level = "none",
        }
    end,
    settings = {
        ltex = {
            checkFrequency = "edit",
            language = "en-GB"
        }
    }
}

require('lspconfig').texlab.setup {
    capabilities = lsp_capabilities,
    on_attach = on_attach
}

-- Markdown LANGUAGE SERVERS CONFIGURATION
lspconfig.marksman.setup {
    capabilities = lsp_capabilities,
}

--- C/C++ LANGUAGE SERVER CONFIGURATION
require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
    end,
    capabilities = lsp_capabilities,
}
