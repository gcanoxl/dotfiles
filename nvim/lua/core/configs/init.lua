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
		},
	},
	icons = require("core.configs.icons"),
}
