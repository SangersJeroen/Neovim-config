return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ bufnr = bufnr })
            end)
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP Actions',
                callback = function(event)
                    local opts = { buffer = event.buf }
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
                    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
                    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("i", "gs", function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set("n", "<C-x>", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<Space>c", function() vim.diagnostic.goto_prev() end, opts)
                    vim.keymap.set("n", "<Space>v", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "<M-p>", function() vim.lsp.buf.format() end)
                    vim.keymap.set('n', '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
                    vim.keymap.set('n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
                    vim.keymap.set('n', '<space>D', function() vim.lsp.buf.type_definition() end, opts)
                    vim.keymap.set('n', '<space>rn', function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set('n', '<M-p>', function() vim.lsp.buf.format() end, opts)
                end
            })
        end
    },
}
