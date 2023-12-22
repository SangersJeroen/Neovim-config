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

local on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvide = false
end

lspconfig.ruff_lsp.setup({
    on_attach = on_attach,
})
