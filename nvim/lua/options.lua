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
	timeoutlen = 4000
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- TODO: find a proper place for the two lines
-- disable for difference between use version and developing version
--
-- vim.g.tokyonight_style = "storm"
-- vim.cmd [[colorscheme tokyonight]]
