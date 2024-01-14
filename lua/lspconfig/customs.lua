vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<M-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<C-x>", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<Space>c", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<Space>v", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<M-p>", function() vim.lsp.buf.format() end)
        vim.keymap.set('n', '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
        vim.keymap.set('n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
        vim.keymap.set('n', '<space>D', function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set('n', '<space>rn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    end
})

-- PYTHON LANGUAGE SERVERS CONFIGURATION ________________________________________________________
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

require("mason-null-ls").setup({
    capabilities = lsp_capabilities,
  ensure_installed = { "black" }
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
  },
})
-- LaTeX LANGUAGE SERVERS CONFIGURATION _________________________________________________________
require("lspconfig").ltex.setup {
    capabilities = lsp_capabilities,
    on_attach = function(client, bufnr)
        require("ltex_extra").setup {
            load_langs = { "en-GB", "en-US" },
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
