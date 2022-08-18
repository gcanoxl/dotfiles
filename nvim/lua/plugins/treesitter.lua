local status_ok, treesitter_configs = pcall(require, 'nvim_treesitter.configs')
if not status_ok then return end

treesitter_configs.setup {
	ensure_installed = { "lua", "vim" },
}
