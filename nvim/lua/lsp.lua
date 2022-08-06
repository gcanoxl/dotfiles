require 'plugins' {

	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",

	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-cmdline',

	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',

	-- improve gui
	'onsails/lspkind.nvim',
	"glepnir/lspsaga.nvim",
	branch = "main",
	config = function()
		local saga = require("lspsaga")
		saga.init_lsp_saga({
			rename_in_select = false,
			borer_style = "rounded",
		})
	end,
}

-- mason
require("mason").setup({
	ui = {
		border = "rounded",
	},
	keymaps = {
		toggle_package_expand = "<TAB>",
	}
})

-- add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'sumneko_lua' }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		capabilities = capabilities,
	}
end

-- auto format on save
vim.cmd [[
augroup formatOnSave
    autocmd!
    autocmd BufWritePre *.lua :lua vim.lsp.buf.formatting()
augroup END
]]

-- lua remove annoying warnings
lspconfig.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}


-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
local lspkind = require('lspkind')
cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text', -- show only symbol annotations
			maxwidth = 50,
		})
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	-- keymaps
	mapping = cmp.mapping.preset.insert({

		['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Select
		}), { 'i' }),
		['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({
			behavior = cmp.SelectBehavior.Select
		}), { 'i' }),
		['<C-c>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
})

-- cmdline
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- keymaps
local nomap = require 'keymaps'
nomap.lnc('sf', 'Lspsaga lsp_finder')
nomap.lnc('sr', 'Lspsaga rename')


return lspconfig
