local status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

treesitter_configs.setup {
	ensure_installed = { "lua", "vim", "c", "python", "go", "dart", "javascript", "markdown", "markdown_inline" },
	highlight = {
		enable = true,
	},

	textobjects = {
		select = {
			enable = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
}
