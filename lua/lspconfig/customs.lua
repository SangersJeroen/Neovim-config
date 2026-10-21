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

vim.diagnostic.config({
    virtual_text = {
        current_line = true,
    },
})

-- No `on_attach` here: a per-server on_attach would replace it, so shared
-- per-client setup lives in the LspAttach autocmd below instead.
vim.lsp.config('*', {
    root_markers = { '.git' },
    capabilities = capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
        end

        -- ty already provides hover; keep ruff to linting, code actions and formatting.
        if client and client.name == 'ruff' then
            client.server_capabilities.hoverProvider = false
        end

        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
        end

        map("K", function() vim.lsp.buf.hover() end, "hover ([K]eyword)")
        map("gd", function() vim.lsp.buf.definition() end, "[g]o to [d]efinition")
        map("gD", function() vim.lsp.buf.declaration() end, "[g]o to [D]eclaration")

        local lsp_split = require('jeroens.lsp_split')
        map("<leader>kv", function() lsp_split.definition_split('vsplit') end, "lo[k]up definition in [v]ertical split")
        map("<leader>kh", function() lsp_split.definition_split('split') end, "lo[k]up definition in [h]orizontal split")

        map("<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, "[w]orkspace [a]dd folder")
        map("<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, "[w]orkspace [r]emove folder")
        map("<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[w]orkspace [l]ist folders")

        map("<M-p>", function() vim.lsp.buf.format() end, "[p]rettify (format) buffer")
    end
})

-- PYTHON LANGUAGE SERVERS CONFIGURATION ________________________________________________________

-- Type checking comes from ty, linting and formatting from ruff.
-- vim.lsp.enable() only starts a server once a buffer with a matching filetype is opened.
vim.lsp.enable({ 'clangd', 'lua_ls', 'ltex', 'ty', 'ruff' })


-- LUA LANGUAGE SERVER CONFIGURATION ____________________________________________________________
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
            telemetry = { enable = false },
        },
    },
})


-- DORMANT SERVERS: configured below but deliberately not enabled (zls, texlab, harper_ls, lemminx).
-- rust_analyzer is managed by rustaceanvim.

-- ZIG LANGUAGE SERVERS CONFIGURATION ___________________________________________________________
vim.lsp.config("zls",
    {
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
    settings = {
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

--- XML configuration
vim.lsp.config("lemminx", {
})
