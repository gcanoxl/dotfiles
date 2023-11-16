return {
	"akinsho/toggleterm.nvim",
	-- version = 'v2.*',
	config = function()
		require("toggleterm").setup({
			direction = 'tab',
			float_opts = {
				border = vim.g.preference.border,
				winblend = vim.g.preference.winblend
			}
		})
		local Terminal  = require('toggleterm.terminal').Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function Lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>G", "<cmd>lua Lazygit_toggle()<CR>", {noremap = true, silent = true})
	end
}

