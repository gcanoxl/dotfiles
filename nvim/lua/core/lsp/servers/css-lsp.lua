return {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	init_options = { provideFormatter = true },
	-- TODO: integrate this
	root_markers = vim.list_extend(vim.deepcopy(core.configs.root_markers), { ".luarc.json" }),
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
}
