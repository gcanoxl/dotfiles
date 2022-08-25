-- dynamically change the font size at runtime
vim.g.gui_font_face = "Courier New"
vim.g.gui_font_default_size = 16
vim.g.gui_font_size = vim.g.gui_font_default_size

RefreshGuiFont = function()
	vim.opt.guifont = string.format("%s:h%s:b", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
	print(1)
	vim.g.gui_font_size = vim.g.gui_font_size + delta
	RefreshGuiFont()
end

ResetGuiFont = function()
	vim.g.gui_font_size = vim.g.gui_font_default_size
	RefreshGuiFont()
end

ResetGuiFont()

local opts = { noremap = true, silent = true }

vim.keymap.set({ 'n', 'i' }, "<D-=>", function() ResizeGuiFont(1) end, opts)
vim.keymap.set({ 'n', 'i' }, "<D-->", function() ResizeGuiFont(-1) end, opts)
vim.keymap.set({ 'n', 'i' }, "<D-0>", ResetGuiFont, opts)
