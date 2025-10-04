-- fullscreen at startup
vim.g.neovide_fullscreen = true

-- dynamically change the font size at runtime
vim.g.gui_font_face = "OperatorMono Nerd Font"
vim.g.gui_font_default_size = 16
vim.opt.linespace = 8
vim.g.gui_font_size = vim.g.gui_font_default_size

-- use option key as meta key
vim.g.neovide_input_macos_option_is_meta = true

RefreshGuiFont = function()
	vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
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
vim.keymap.set({ "n", "i" }, "<D-=>", function()
	ResizeGuiFont(1)
end, opts)
vim.keymap.set({ "n", "i" }, "<D-->", function()
	ResizeGuiFont(-1)
end, opts)
vim.keymap.set({ "n", "i" }, "<D-0>", ResetGuiFont, opts)

-- Buffers
-- vim.keymap.set("n", "<D-t>", utils.cmd("enew"))

-- Tabs
-- vim.keymap.set("n", "<D-1>", utils.cmd('exec "normal! 1gt"'))
-- vim.keymap.set("n", "<D-2>", utils.cmd('exec "normal! 2gt"'))
-- vim.keymap.set("n", "<D-3>", utils.cmd('exec "normal! 3gt"'))
-- vim.keymap.set("n", "<D-4>", utils.cmd('exec "normal! 4gt"'))
-- vim.keymap.set("n", "<D-5>", utils.cmd('exec "normal! 5gt"'))
-- vim.keymap.set("n", "<D-6>", utils.cmd('exec "normal! 6gt"'))
-- vim.keymap.set("n", "<D-7>", utils.cmd('exec "normal! 7gt"'))
-- vim.keymap.set("n", "<D-8>", utils.cmd('exec "normal! 8gt"'))
-- vim.keymap.set("n", "<D-9>", utils.cmd('exec "normal! 9gt"'))

-- disable all animations
vim.g.neovide_position_animation_length = 0
vim.g.neovide_cursor_animation_length = 0.00
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0.00
