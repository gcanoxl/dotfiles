return {
	-- Snippet Engine
	{
		'L3MON4D3/LuaSnip',
		config = function()
			local _, lua_loader = pcall(require, "luasnip/loaders/from_lua")
			lua_loader.lazy_load({ paths = "./snippets" })
		end
	},
}
