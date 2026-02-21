return {
	root_markers = { ".project", ".git" },
	lsp = {
		servers = {
			-- Lua
			"lua_ls",
			-- Python
			"pyright",
			-- Shell
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
			-- C & C++
			"clangd",
		},
	},
	icons = require("core.configs.icons"),
}
