return {
	-- Markdown Preview
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		ft = { "markdown" },
		config = function()
			require("peek").setup({
				auto_load = true,
				close_on_bdelete = true,
				syntax = true,
				theme = "light", -- 'dark' or 'light'
				update_on_change = true,
				app = "browser",
			})

			vim.api.nvim_buf_create_user_command(0, "PeekOpen", require("peek").open, {})
			vim.api.nvim_buf_create_user_command(0, "PeekClose", require("peek").close, {})
		end,
	},

	-- Emoji Finder
	{
		"xiyaowong/telescope-emoji.nvim",
		config = function()
			require("telescope").load_extension("emoji")
		end,
	},
}
