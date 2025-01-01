-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local options = {
	exrc = true,
	clipboard = "unnamedplus",
	termguicolors = true,
	mouse = "a",
	fileencoding = "utf-8",
	ignorecase = true,
	autoindent = true,
	tabstop = 2,
	shiftwidth = 2,
	number = true,
	relativenumber = true,
	wrap = true,
	cursorline = true,
	cursorcolumn = false,
	timeout = true,
	timeoutlen = 800,
	winblend = 6,
	swapfile = false,
	cmdheight = 0,
	laststatus = 3,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.preference = {
	-- border = "none",
	border = "rounded",
	winblend = 4,
}
