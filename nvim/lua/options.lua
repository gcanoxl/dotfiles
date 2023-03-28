local options = {
	clipboard = 'unnamedplus',
	termguicolors = true,
	mouse = 'a',
	fileencoding = 'utf-8',
	ignorecase = true,
	autoindent = true,
	tabstop = 2,
	shiftwidth = 2,
	number = true,
	relativenumber = false,
	wrap = true,
	cursorline = true,
	cursorcolumn = false,
	timeout = true,
	timeoutlen = 800,
	winblend = 6,
	cmdheight = 0,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.preference = {
	border = 'rounded',
	winblend = 4
}
