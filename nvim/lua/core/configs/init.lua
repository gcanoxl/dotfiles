return {
	root_markers = { ".project", ".git" },
	lsp = {
		servers = {
			-- Lua
			"lua_ls",
			-- Shell
			"shellcheck",
			"bashls",
		},
	},
	icons = require("core.configs.icons"),
}
