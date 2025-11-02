return {
	root_markers = { ".project", ".git" },
	lsp = {
		servers = {
			-- Lua
			"lua_ls",
			-- Shell
			"shellcheck",
			"bashls",
			-- Web Frontend
			"html-lsp",
			"css-lsp",
			-- TS
			"ts_ls",
		},
	},
	icons = require("core.configs.icons"),
}
