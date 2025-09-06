-- PYTHON LANGUAGE SERVERS CONFIGURATION ________________________________________________________
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.diagnostic.config({
    virtual_text = {
        current_line = false,
    },
})

vim.lsp.config('*', {
    capabilities = lsp_capabilities,
    root_markers = {'.git'},
})

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


-- PYTHON

local venv_path = os.getenv('VIRTUAL_ENV')
local py_path = nil
-- decide which python executable to use for mypy
if venv_path ~= nil then
    py_path = venv_path .. "/bin/python3"
else
    py_path = vim.g.python3_host_prog
end


vim.lsp.enable('basedpyright')
vim.lsp.enable('ruff')



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
    on_attach = on_attach,
    setting = {
        texlab = {
            forwardSearch = {
                executable = '/home/jeroensangers/.local/bin/sioyek/sioyek',
                args = {
                    '--reuse-window',
                    '--execute-command', 'toggle_synctex', -- Open Sioyek in synctex mode.
                    '--inverse-search',
                    '--new-instance',
                    [[nvim-texlabconfig -file %%%1 -line %%%2 -server ]] .. vim.v.servername,
                    '--forward-search-file', '%f',
                    '--forward-search-line', '%l', '%p' },
            },
        },
    },
}

require('lspconfig').harper_ls.setup {
    settings = {
        ["harper-ls"] = {
            userDictPath = "~/.config/nvim/spell/",
            fileDictPath = "",
            linters = {
                SpellCheck = true,
                SpelledNumbers = false,
                AnA = true,
                SentenceCapitalization = true,
                UnclosedQuotes = true,
                WrongQuotes = false,
                LongSentences = true,
                RepeatedWords = true,
                Spaces = true,
                Matcher = true,
                CorrectNumberSuffix = true
            },
            codeActions = {
                ForceStable = false
            },
            markdown = {
                IgnoreLinkTitle = false
            },
            diagnosticSeverity = "hint",
            isolateEnglish = false
        }
    }
}

--- C/C++ LANGUAGE SERVER CONFIGURATION
require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
    end,
    capabilities = lsp_capabilities,
}

--- Rust configuration
-- lspconfig.rust_analyzer.setup({
--     on_attach = function (client, bufnr)
--         vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
--     end,
--     capabilities = lsp_capabilities,
--     filetypes = { 'rust' },
--     settings = {
--         ['rust-analyzer'] = {
--             cargo = { allFeatures = true, },
--             check = { command = "clippy" },
--             diagnositcs = { enable = true },
--         },
--     },
-- }
-- )
--



--- XML configuration
require('lspconfig').lemminx.setup {
    capabilities = lsp_capabilities,
}
