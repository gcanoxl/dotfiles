-- fullscreen at startup
vim.g.neovide_fullscreen = true

-- dynamically change the font size at runtime
vim.g.gui_font_face = "Courier New"
-- vim.g.gui_font_face = "OperatorMono Nerd Font"
vim.g.gui_font_default_size = 16
vim.opt.linespace = 12
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
vim.keymap.set({ "n", "i" }, "<D-=>", function()
	ResizeGuiFont(1)
end, opts)
vim.keymap.set({ "n", "i" }, "<D-->", function()
	ResizeGuiFont(-1)
end, opts)
vim.keymap.set({ "n", "i" }, "<D-0>", ResetGuiFont, opts)

-- Buffers
vim.keymap.set("n", "<D-t>", geem.cmd("enew"))

-- Tabs
vim.keymap.set("n", "<D-1>", geem.cmd('exec "normal! 1gt"'))
vim.keymap.set("n", "<D-2>", geem.cmd('exec "normal! 2gt"'))
vim.keymap.set("n", "<D-3>", geem.cmd('exec "normal! 3gt"'))
vim.keymap.set("n", "<D-4>", geem.cmd('exec "normal! 4gt"'))
vim.keymap.set("n", "<D-5>", geem.cmd('exec "normal! 5gt"'))
vim.keymap.set("n", "<D-6>", geem.cmd('exec "normal! 6gt"'))
vim.keymap.set("n", "<D-7>", geem.cmd('exec "normal! 7gt"'))
vim.keymap.set("n", "<D-8>", geem.cmd('exec "normal! 8gt"'))
vim.keymap.set("n", "<D-9>", geem.cmd('exec "normal! 9gt"'))

-- Smart Splits
vim.keymap.set("n", "<C-S-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<C-S-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<C-S-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<C-S-l>", require("smart-splits").resize_right)

-- Transparency
local Hydra = require("hydra")
Hydra({
	name = "Transparency",
	mode = "n",
	body = "<leader>ap",
	heads = {
		{
			"+",
			function()
				vim.g.neovide_transparency = vim.g.neovide_transparency + 0.05
			end,
			{ desc = "Increase" },
		},
		{
			"-",
			function()
				vim.g.neovide_transparency = vim.g.neovide_transparency - 0.05
			end,
			{ desc = "Descrease" },
		},
		{
			"=",
			function()
				vim.g.neovide_transparency = 1
			end,
			{ desc = "Reset" },
		},
	},
})
