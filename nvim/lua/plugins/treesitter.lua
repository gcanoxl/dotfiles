return {
	-- Syntax Highlighting
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		-- Rainbow Brackets
		"HiPhish/nvim-ts-rainbow2",
		-- Text Objects based on treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- Playground for treesitter
		"nvim-treesitter/playground",
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
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
				"json",
				"typescript",
				"tsx",
				"css",
				"html",
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
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[C"] = "@class.outer",
					},
				},
			},
			rainbow = {
				enable = false,
			},
		})
	end,
}
