vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<M-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<C-x>", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<Space>c", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<Space>v", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<M-p>", function() vim.lsp.buf.format() end)
    end
})

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
    filetype = {"python"},
})

require("lspconfig").ltex.setup {
    capabilities = lsp_capabilities,
    on_attach = function(client, bufnr)
        require("ltex_extra").setup{
            load_langs = { "en-GB", "en-US" },
            init_check = true,
            path = os.getenv("HOME").."/.config/nvim/spell",
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


