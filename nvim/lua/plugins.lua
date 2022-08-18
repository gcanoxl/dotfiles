local geem_plugins = {
	-- manage itself
	'wbthomason/packer.nvim',

	-- Colorschemes
	'dr4vs/neon.nvim',
	'folke/tokyonight.nvim',

	-- Dependencies
	-- TODO: furthr detailed descriptions
	'kyazdani42/nvim-web-devicons',
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",

	-- Status Line
	{
		'feline-nvim/feline.nvim',
		config = function() require('feline').setup() end
	},

	-- Buffer Line
	{
		'akinsho/bufferline.nvim', tag = "v2.*",
		config = function() require 'plugins.bufferline' end
	},

	-- Neo Tree
	{
		"nvim-neo-tree/neo-tree.nvim", branch = "v2.x",
		config = function() require 'plugins.neo-tree' end
	},

	-- Hop
	{
		'phaazon/hop.nvim', branch = 'v2'
	}

}

geem.initialize_packer()

local status_ok, packer = pcall(require, 'packer')
if status_ok then
	packer.startup({
		function(use)
			for _, plugin in ipairs(geem_plugins) do
				use(plugin)
			end
		end,
		-- Packer's config
		config = {
			ensure_dependencies = true,

			display = {
				keybindings = { -- Keybindings for the display window
					toggle_info = '<TAB>',
				},
				open_fn = function()
					return require('packer.util').float({ border = 'rounded' })
				end
			}
		}
	})
end
