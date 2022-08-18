local status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

treesitter_configs.setup {
	ensure_installed = { "lua", "vim", "c", "python", "go", "dart", "javascript" },
	highlight = {
		enable = true,
	},
}
