return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
	root_markers = vim.deepcopy(core.configs.root_markers),
}
