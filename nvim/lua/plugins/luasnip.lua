local avali, _ = pcall(require, 'luasnip')
local lua_loader_avail, lua_loader = pcall(require, "luasnip/loaders/from_lua")
if not (avali and lua_loader_avail) then return end

lua_loader.lazy_load({ paths = "./snippets" })
