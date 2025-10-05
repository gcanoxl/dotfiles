return {
	root_markers = { ".project", ".git" },
	lsp = {
		servers = {
			"lua_ls",
			"vimls",
			"pyright",
			"jsonls",
			"yamlls",
			"ts_ls",
			"html",
			"clangd",
			"postgres_lsp",
		},
	},
	icons = require("core.configs.icons"),
}
