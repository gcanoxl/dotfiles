local geem_plugins = {
	-- Plugin manger
	'wbthomason/packer.nvim',

	-- Colorschemes
	'dr4vs/neon.nvim',
	'folke/tokyonight.nvim',

	-- Icons
	'kyazdani42/nvim-web-devicons',

	-- Lua Fucntions
	"nvim-lua/plenary.nvim",

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

	-- File Explorer
	{
		"nvim-neo-tree/neo-tree.nvim", branch = "v2.x",
		requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
		config = function() require 'plugins.neo-tree' end
	},

	-- Mouse Movement
	{
		'phaazon/hop.nvim', branch = 'v2'
	},

	-- Git Client
	{
		'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
		config = function() require('neogit').setup() end
	},

	-- Session Manager
	{
		'Shatur/neovim-session-manager',
		config = function() require('session_manager').setup() end
	},

	-- Lsp Config
	"neovim/nvim-lspconfig",

	-- Lsp Manager
	{
		"williamboman/mason.nvim",
		config = function() require 'plugins.mason' end
	},

	-- Lsp Icons
	'onsails/lspkind.nvim',

	-- Snippet Engine
	{
		'L3MON4D3/LuaSnip',
		config = function() require 'plugins.luasnip' end
	},

	-- Completion Engine
	{
		'hrsh7th/nvim-cmp',
		config = function() require 'plugins.cmp' end
	},

	-- Lsp Completion Source
	{
		'hrsh7th/cmp-nvim-lsp',
		after = 'nvim-cmp'
	},

	-- Snippet Completion Source
	{
		'saadparwaiz1/cmp_luasnip',
		after = 'nvim-cmp'
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
