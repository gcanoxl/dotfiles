return {
	"CRAG666/code_runner.nvim",
	config = function()
		require('code_runner').setup({
			mode = "term",
			focus = false,
			term = {
				--  Position to open the terminal, this option is ignored if mode ~= term
				position = "vertical leftabove",
				-- window size, this option is ignored if mode == tab
				size = 36,
			},
			filetype = {
				python = "python3 -u",
			},
		})
	end
}
