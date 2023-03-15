local ls = require "luasnip"
local types = require "luasnip.util.types"

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/jeroens/.config/nvim/snippets" } })
require("luasnip.loaders.from_snipmate").lazy_load()


vim.keymap.set({"i","s"}, "<Tab>", function ()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })


vim.keymap.set({ "i", "s" }, "<Tab>j", function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end,  {silent = true})









