require 'plugins' {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	requires = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		require('neo-tree').setup({
			window = {
				width = 24
			}
		})
	end
}

-- keymaps
local nomap = require 'keymaps'
nomap.lnc('fl', ':Neotree')
