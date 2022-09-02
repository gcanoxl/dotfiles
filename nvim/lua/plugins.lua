local geem_plugins = {
	-- Plugin manger
	'wbthomason/packer.nvim',

	-- Colorschemes
	{
		"catppuccin/nvim", as = "catppuccin",
		config = function() require('plugins.colorschemes.catppuccin') end
	},

	-- Icons
	'kyazdani42/nvim-web-devicons',

	-- Lua Fucntions
	"nvim-lua/plenary.nvim",

	-- Prettier UI
	'stevearc/dressing.nvim',

	-- Status Line
	{
		'feline-nvim/feline.nvim',
		config = function() require 'plugins.feline' end
	},

	-- Buffer Line
	{
		'akinsho/bufferline.nvim', tag = "v2.*",
		config = function() require 'plugins.bufferline' end
	},

	-- Fuzzy Finder
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		config = function() require('plugins.telescope') end
	},

	'nvim-telescope/telescope-ui-select.nvim',

	-- File Explorer
	{
		"nvim-neo-tree/neo-tree.nvim", branch = "v2.x",
		requires = { "MunifTanjim/nui.nvim" },
		config = function() require 'plugins.neo-tree' end
	},

	-- Mouse Movement
	{
		'phaazon/hop.nvim', branch = 'v2',
		config = function() require 'hop'.setup() end
	},

	-- Better Commenting
	{
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	},

	-- Git Client
	{
		'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
		config = function() require('neogit').setup() end
	},

	-- Session Manager
	{
		'Shatur/neovim-session-manager',
		config = function() require('session_manager').setup({}) end
	},

	-- Syntax Highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require('plugins.treesitter') end
	},

	-- Text Objects based on treesitter
	'nvim-treesitter/nvim-treesitter-textobjects',

	-- Lsp Manager
	"williamboman/mason-lspconfig.nvim",
	{
		"williamboman/mason.nvim",
		config = function() require('plugins.mason') end
	},

	-- Lsp Config
	{
		"neovim/nvim-lspconfig",
		config = function() require('plugins.lsp') end
	},

	-- Lsp Icons
	'onsails/lspkind.nvim',

	-- Lsp Signature
	{
		"ray-x/lsp_signature.nvim",
		config = function() require "lsp_signature".setup({}) end
	},

	-- Snippet Engine
	{
		'L3MON4D3/LuaSnip',
		config = function() require('plugins.luasnip') end
	},

	-- Snippet Collection
	"rafamadriz/friendly-snippets",

	-- Completion Engine
	{
		'hrsh7th/nvim-cmp',
		config = function() require 'plugins.cmp' end
	},

	-- Lsp Completion Source
	'hrsh7th/cmp-nvim-lsp',

	-- Snippet Completion Source
	'saadparwaiz1/cmp_luasnip',

	-- Better Buffer Closing
	'famiu/bufdelete.nvim',

	-- Todo List
	{
		"folke/todo-comments.nvim",
		config = function() require('todo-comments').setup() end
	},

	-- TODO: search and quickfixlist
	-- Terminal
	{
		"akinsho/toggleterm.nvim", tag = 'v2.*',
		config = function() require("toggleterm").setup({
				direction = 'float',
				float_opts = {
					border = vim.g.preference.border,
					winblend = vim.g.preference.winblend
				}
			})
		end
	},

	-- Auto Pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require('nvim-autopairs').setup()
		end
	},

	-- Go Support
	{
		'ray-x/go.nvim',
		ft = { 'go' },
		config = function() require('plugins.go') end
	},
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
		-- TODO: change compilered file so that
		-- TODO: delete the line in gitignore file
		config = {
			ensure_dependencies = true,

			display = {
				keybindings = { -- Keybindings for the display window
					toggle_info = '<TAB>',
				},
				open_fn = function()
					return require('packer.util').float({ border = vim.g.preference.border })
				end
			}
		}
	})
end
