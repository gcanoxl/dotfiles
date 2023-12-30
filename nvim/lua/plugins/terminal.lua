return {
	"akinsho/toggleterm.nvim",
	config = function()
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<C-h>", geem.cmd("wincmd h"), opts)
			vim.keymap.set("t", "<C-j>", geem.cmd("wincmd j"), opts)
			vim.keymap.set("t", "<C-k>", geem.cmd("wincmd k"), opts)
			vim.keymap.set("t", "<C-l>", geem.cmd("wincmd l"), opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			vim.keymap.set("t", "<C-c>", geem.cmd("ToggleTerm"), opts)
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
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "tab",
		})

		vim.keymap.set("n", "<leader>G", function()
			lazygit:toggle()
		end, { noremap = true, silent = true })
	end,
}
