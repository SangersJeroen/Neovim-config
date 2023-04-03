local ls = require "luasnip"
local types = require "luasnip.util.types" 

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/jeroens/.config/nvim/snippets" } })
require("luasnip.loaders.from_snipmate").lazy_load()

