---@type vim.lsp.Config
return {
	cmd = { 'emmet-ls', '--stdio' },
	filetypes = {
		'astro',
		'css',
		'eruby',
		'html',
		'htmlangular',
		'htmldjango',
		'javascriptreact',
		'less',
		'pug',
		'sass',
		'scss',
		'svelte',
		'templ',
		'typescriptreact',
		'vue',
	},
	-- TODO: integrate this
	root_markers = vim.list_extend(core.configs.root_markers, { ".luarc.json" }),
}
