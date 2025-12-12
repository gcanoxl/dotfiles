return {
	root_markers = { ".project", ".git" },
	lsp = {
		servers = {
			-- Lua
			"lua_ls",
			-- Shell
			"shellcheck",
			"bashls",
			-- SwiftUI
			{
				"sourcekit-lsp",
				mason = false,
			},
			-- Flutter
			{
				"dartls",
				enabled = false,
				mason = false,
			},
			-- Frontend
			"html-lsp",
			"css-lsp",
			"ts_ls",
			"emmet-ls",
		},
	},
	icons = require("core.configs.icons"),
}
