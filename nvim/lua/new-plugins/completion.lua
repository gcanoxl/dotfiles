return {
	-- Snippet Engine
	{
		'L3MON4D3/LuaSnip',
		config = function()
			local _, lua_loader = pcall(require, "luasnip/loaders/from_lua")
			lua_loader.lazy_load({ paths = "./snippets" })
		end
	},
	-- Completion Engine
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require('cmp')
			local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
			local lspkind_status_ok, lspkind = pcall(require, 'lspkind')

			cmp.setup({
				completion = {
					completeopt = 'menu,menuone,noinsert'
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					format = lspkind_status_ok and lspkind.cmp_format({
						mode = 'symbol_text',
						maxwidth = 50,
					})
				},
				snippet = {
					expand = function(args)
						if luasnip_status_ok then
							luasnip.lsp_expand(args.body)
						end
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
					{ name = 'path', option = {
						get_cwd = function()
							if vim.bo.filetype == "dart" then
								-- TODO: fix here!!!!
								-- ah
							end
						end
					} },
				},
			})
		end
	},

	-- Lsp Completion Source
	'hrsh7th/cmp-nvim-lsp',

	-- Snippet Completion Source
	'saadparwaiz1/cmp_luasnip',

	-- Path Source
	'hrsh7th/cmp-path',

}
