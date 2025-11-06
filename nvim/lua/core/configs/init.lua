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
			-- C & C++
			"clangd",
		},
	},
	icons = require("core.configs.icons"),
}
