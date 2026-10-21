-- No LSP or snippets on this branch: completion comes from words in open buffers and file paths.
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
            sources = {
                default = { 'path', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        }
    },
}
