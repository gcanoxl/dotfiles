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
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-path',
		},
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
						symbol_map = { Copilot = "" }
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
					["<Tab>"] = cmp.mapping(function(fallback)
						if require("copilot.suggestion").is_visible() then
							require("copilot.suggestion").accept()
						elseif cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						elseif luasnip.expandable() then
							luasnip.expand()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{
						name = 'path',
						option = {
							get_cwd = function()
								if vim.bo.filetype == "dart" then
									return vim.fn.getcwd()
								end
							end
						}
					},
					{ name = "copilot", priority = 9000, }
				},
			})
		end
	},

	-- Copilot Source
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			-- setup copilot.lua
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
			-- setup copilot-cmp
			require("copilot_cmp").setup()
		end
	},
}
