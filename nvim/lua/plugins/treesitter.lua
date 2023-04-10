local status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

treesitter_configs.setup {
	ensure_installed = { "lua", "vim", "c", "python", "go", "dart", "javascript", "markdown", "markdown_inline" },

	highlight = {
		enable = true,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-0>",
			node_incremental = "<C-=>",
			node_decremental = "<C-->",
		},
	},

	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	rainbow = {
		enable = true,
	},
}
