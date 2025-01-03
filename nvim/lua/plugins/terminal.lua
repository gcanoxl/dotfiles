return {
	"akinsho/toggleterm.nvim",
	config = function()
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<C-h>", utils.cmd("wincmd h"), opts)
			vim.keymap.set("t", "<C-j>", utils.cmd("wincmd j"), opts)
			vim.keymap.set("t", "<C-k>", utils.cmd("wincmd k"), opts)
			vim.keymap.set("t", "<C-l>", utils.cmd("wincmd l"), opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			vim.keymap.set("t", "<C-c>", utils.cmd("ToggleTerm"), opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		require("toggleterm").setup({
			direction = "horizontal",
			float_opts = {
				border = vim.g.preference.border,
				winblend = vim.g.preference.winblend,
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		utils.lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "tab",
		})
	end,
}
