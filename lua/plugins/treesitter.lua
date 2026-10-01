-- Uses the `main` branch of nvim-treesitter: setup() only manages parsers,
-- highlighting and indent are enabled per-buffer below.
return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup()
            require('nvim-treesitter').install({
                "c", "lua", "vim", "python", "latex", "markdown", "cpp", "html", "yaml",
            })

            local no_highlight = { latex = true }

            vim.api.nvim_create_autocmd('FileType', {
                desc = 'Enable treesitter highlight and indent',
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match)
                    if not lang or no_highlight[lang] then
                        return
                    end
                    if pcall(vim.treesitter.start, args.buf, lang) then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end
    },
}
