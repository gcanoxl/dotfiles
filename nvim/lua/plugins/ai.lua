return {
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup({
				enabled = true,
				silent = true,
				filetypes = {
					help = false,
					gitrebase = false,
					["."] = false,
					["cpp"] = false,
				},
			})
			vim.keymap.set("i", "<C-k>", neocodeium.accept)
		end,
	},
	{
		"folke/sidekick.nvim",
		opts = {
			-- add any options here
			cli = {
				mux = {
					backend = "zellij",
					enabled = false,
				},
			},
		},
		keys = {
			{
				"<tab>",
				function()
					-- if there is a next edit, jump to it, otherwise apply it if any
					if not require("sidekick").nes_jump_or_apply() then
						return "<Tab>" -- fallback to normal tab
					end
				end,
				expr = true,
				desc = "Goto/Apply Next Edit Suggestion",
			},
			{
				"<c-.>",
				function() require("sidekick.cli").toggle({ name = "codex", focus = true }) end,
				desc = "Sidekick Toggle",
				mode = { "n", "t", "i", "x" },
			},
			{
				"<leader>ai",
				function()
					require("sidekick.cli").toggle({ focus = true })
				end,
				desc = "Sidekick Toggle CLI",
				mode = { "n", "v" },
			},
			{
				"<leader>ap",
				function()
					require("sidekick.cli").prompt()
				end,
				desc = "Sidekick Ask Prompt",
				mode = { "n", "v" },
			},
		},
	},
	{
		"404pilo/aicommits.nvim",
		config = true,
	},
}
