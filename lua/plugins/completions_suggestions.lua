return {
    {
        'saghen/blink.cmp',
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'enter' },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
            },
            signature = { enabled = true },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            snippets = { preset = 'luasnip' },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        }
    },
    {
        "xzbdmw/colorful-menu.nvim",
        config = function()
            require("blink.cmp").setup({
                completion = {
                    menu = {
                        draw = {
                            -- We don't need label_description now because label and label_description are already
                            -- combined together in label by colorful-menu.nvim.
                            columns = { { "kind_icon" }, { "label", gap = 1 } },
                            components = {
                                label = {
                                    text = function(ctx)
                                        return require("colorful-menu").blink_components_text(ctx)
                                    end,
                                    highlight = function(ctx)
                                        return require("colorful-menu").blink_components_highlight(ctx)
                                    end,
                                },
                            },
                        },
                    },
                },
            })
        end
    },
}
