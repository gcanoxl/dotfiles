local geem_plugins = {
	-- manage itself
	'wbthomason/packer.nvim',

	-- Colorschemes
	'dr4vs/neon.nvim',
	'folke/tokyonight.nvim',

	-- Status Line
	{
		'feline-nvim/feline.nvim',
		config = function()
			require('feline').setup()
		end
	},

	-- Buffer Line
	{ 'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require 'plugins.bufferline'
		end
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
