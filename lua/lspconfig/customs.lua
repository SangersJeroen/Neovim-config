-- PYTHON LANGUAGE SERVERS CONFIGURATION ________________________________________________________
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local get_servers = require('mason-lspconfig').get_installed_servers

for _, server_name in ipairs(get_servers()) do
    lspconfig[server_name].setup({
        capabilities = lsp_capabilities,
    })
end

lspconfig.pyright.setup({
    capabilities = lsp_capabilities,
    filetype = { "python" },
})

local on_attach_ruff = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
end

lspconfig.ruff_lsp.setup({
    capabilities = lsp_capabilities,
    on_attach = on_attach_ruff,
})

-- require("mason-null-ls").setup({
--     capabilities = lsp_capabilities,
--     ensure_installed = { "black" }
-- })
--
-- local null_ls = require("null-ls")
--
-- null_ls.setup({
--   sources = {
--     null_ls.builtins.formatting.black,
--   },
-- })
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

-- Markdown LANGUAGE SERVERS CONFIGURATION
lspconfig.marksman.setup{
    capabilities = lsp_capabilities,
}

--- C/C++ LANGUAGE SERVER CONFIGURATION
require("lspconfig").clangd.setup{
    on_attach = function (client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
    end,
    capabilities = lsp_capabilities,
}
