---@diagnostic disable: missing-fields
return {
	-- Snippet Engine
	{
		"L3MON4D3/LuaSnip",
		config = function()
			local _, lua_loader = pcall(require, "luasnip/loaders/from_lua")
			lua_loader.lazy_load({ paths = "./snippets" })
		end,
	},
	-- Completion Engine
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip_status_ok, luasnip = pcall(require, "luasnip")
			local lspkind_status_ok, lspkind = pcall(require, "lspkind")

			local opts = {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					format = lspkind_status_ok and lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						symbol_map = { Copilot = "" },
					}),
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
					["<C-c>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{
						name = "path",
						option = {
							get_cwd = function()
								if vim.bo.filetype == "dart" then
									return vim.fn.getcwd()
								end
							end,
						},
					},
				},
			}

			if vim.g.preference.border ~= "none" then
				opts.window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				}
			end
			cmp.setup(opts)
		end,
	},

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		config = function()
			-- setup copilot.lua
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-k>",
					},
				},
			})
		end,
	},
}
