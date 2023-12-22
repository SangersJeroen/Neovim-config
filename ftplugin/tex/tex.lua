vim.g.vimtex_compiler_method = 'latexmk'
vim.g.tex_flavor = 'lualatex'

-- vim.g.vimtex_fold_enabled = true
vim.g.vimtex_format_enabled = true

vim.g.maplocalleader = '\\'
vim.g.vimtex_view_method = 'sioyek'

vim.opt_local.expandtab = true
vim.opt_local.autoindent = true
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

vim.keymap.set('n', '<localleader>ll', '<cmd>VimtexCompile<cr>')
vim.keymap.set('n', '<localleader>lv', '<cmd>VimtexView<cr>')

vim.g.vimtex_quickfix_ignore_filters = {
    'LaTeX hooks Warning',
    'Underfull \\hbox',
    'Overfull \\hbox',
    'LaTeX Warning: h float specifier changed to',
    'Package siunitx Warning: Detected the "physics" package:',
    'Package hyperref Warning: Token not allowed in a PDF string',
    'Fatal error occurred, no output PDF file produced!'
}

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

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
