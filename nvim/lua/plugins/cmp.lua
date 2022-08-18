local cmp_status_ok, cmp = pcall(require, 'cmp')
local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not (cmp_status_ok and luasnip_status_ok) then return end

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

local cmdline_status_ok, _ = pcall(require, 'cmdline')
if cmdline_status_ok then
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})
end
