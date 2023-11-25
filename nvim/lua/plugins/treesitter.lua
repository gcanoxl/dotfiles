return {
	-- Syntax Highlighting
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	dependencies = {
		-- Rainbow Brackets
		'HiPhish/nvim-ts-rainbow2',
		-- Text Objects based on treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		-- Playground for treesitter
		'nvim-treesitter/playground'
	},
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				"lua",
				"vim",
				"c",
				"python",
				"go",
				"dart",
				"javascript",
				"markdown",
				"markdown_inline",
				"json"
			},

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
	end

}
