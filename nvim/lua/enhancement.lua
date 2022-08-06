-- todolist
require'plugins' {
	"folke/todo-comments.nvim",
	requires = "nvim-lua/plenary.nvim",
}
require("todo-comments").setup {}
local nomap = require'keymaps'
nomap.lnc('ts', 'TodoTelescope')
nomap.lnc('tt', 'TodoQuickFix')

-- terminal
require'plugins' {
	"akinsho/toggleterm.nvim", tag = 'v2.*'
}
require("toggleterm").setup()
nomap.lnc('``', 'ToggleTerm')
