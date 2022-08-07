local geem_plugins = {

	{
		['"folke/which-key.nvim"'] = {
			config = function()
				require("which-key").setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				}
			end
		}
	},

	{
		['goolord/alpha-nvim'] = {
			config = function()
				require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
			end
		}
	},

	{
		["folke/trouble.nvim"] = {

			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				}
			end
		}

	}
}

geem.initialize_packer()

local status_ok, packer = pcall(require, 'packer')
if status_ok then
	packer.startup {
		function(use)
			for _, plugin_list in ipairs(geem_plugins) do
				for name, options in pairs(plugin_list) do
					use(name)
				end
			end
		end
	}
end
