-- LANGUAGE SERVERS CONFIGURATION ________________________________________________________

local capabilities = {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
    }
}
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

local on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable()
    end
end

vim.diagnostic.config({
    capabilities = capabilities,
    virtual_text = {
        current_line = true,
    },
})

vim.lsp.config('*', {
    root_markers = { '.git' },
    capabilities = capabilities,
    on_attach = on_attach
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(event)
        local bufopts = { buffer = event.buf }
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

-- PYTHON LANGUAGE SERVERS CONFIGURATION ________________________________________________________

local venv_path = os.getenv('VIRTUAL_ENV')
local py_path = nil
-- decide which python executable to use for mypy
if venv_path ~= nil then
    py_path = venv_path .. "/bin/python3"
else
    py_path = vim.g.python3_host_prog
end


vim.lsp.enable('basedpyright')
-- vim.lsp.enable('zuban')
vim.lsp.enable('ruff')


-- ZIG LANGUAGE SERVERS CONFIGURATION ___________________________________________________________
vim.lsp.config("zls",
    {
        on_attach = on_attach,
        cmd = { "zls" },
        filetypes = { "zig", "zir" },
        single_file_support = true,
    }
)


-- LaTeX LANGUAGE SERVERS CONFIGURATION
vim.lsp.config("ltex", {
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
})

vim.lsp.config("texlab", {
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
})

vim.lsp.config("harper_ls", {
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
})

--- C/C++ LANGUAGE SERVER CONFIGURATION
vim.lsp.config('clangd', {
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
    end,
})

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
vim.lsp.config("lemminx", {
})
