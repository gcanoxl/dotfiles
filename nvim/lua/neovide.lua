-- fullscreen at startup
vim.g.neovide_fullscreen = true

-- dynamically change the font size at runtime
vim.g.gui_font_face = 'OperatorMono Nerd Font'
vim.g.gui_font_default_size = 16
vim.opt.linespace = 8
vim.g.gui_font_size = vim.g.gui_font_default_size

-- use option key as meta key
vim.g.neovide_input_macos_option_is_meta = true

RefreshGuiFont = function() vim.opt.guifont = string.format('%s:h%s', vim.g.gui_font_face, vim.g.gui_font_size) end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

ResetGuiFont()

-- Keymaps only for GUI
local opts = { noremap = true, silent = true }
vim.keymap.set({ 'n', 'i' }, '<D-=>', function() ResizeGuiFont(1) end, opts)
vim.keymap.set({ 'n', 'i' }, '<D-->', function() ResizeGuiFont(-1) end, opts)
vim.keymap.set({ 'n', 'i' }, '<D-0>', ResetGuiFont, opts)

-- disable all animations
vim.g.neovide_position_animation_length = 0
vim.g.neovide_cursor_animation_length = 0.00
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0.00
