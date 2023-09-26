-- dynamically change the font size at runtime
vim.g.gui_font_face = "Courier New"
vim.g.gui_font_default_size = 16
vim.g.gui_font_size = vim.g.gui_font_default_size

RefreshGuiFont = function()
	vim.opt.guifont = string.format("%s:h%s:b", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
	vim.g.gui_font_size = vim.g.gui_font_size + delta
	RefreshGuiFont()
end

ResetGuiFont = function()
	vim.g.gui_font_size = vim.g.gui_font_default_size
	RefreshGuiFont()
end

ResetGuiFont()

local opts = { noremap = true, silent = true }

-- Keymaps only for GUI
vim.keymap.set({ 'n', 'i' }, "<D-=>", function() ResizeGuiFont(1) end, opts)
vim.keymap.set({ 'n', 'i' }, "<D-->", function() ResizeGuiFont( -1) end, opts)
vim.keymap.set({ 'n', 'i' }, "<D-0>", ResetGuiFont, opts)

-- Tabs
vim.keymap.set('n', '<D-t>', geem.cmd('tabnew'))
vim.keymap.set('n', '<D-w>', geem.cmd('tabclose'))
vim.keymap.set('n', '<D-o>', geem.cmd('tabnew split'))
vim.keymap.set('n', '<C-D-o>', function()
	print(vim.inspect(geem.cmd))
end)

-- Smart Splits
vim.keymap.set('n', '<C-S-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-S-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-S-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-S-l>', require('smart-splits').resize_right)
