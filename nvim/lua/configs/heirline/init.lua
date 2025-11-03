local utils = require("heirline.utils")

local ViMode = require("configs.heirline.components.vi_mode")
local FilePath = require("configs.heirline.components.fs")
local ornaments = require("configs.heirline.components.ornaments")
local layouts = require("configs.heirline.components.layouts")
local debugger = require("configs.heirline.components.debugger")

local StatusLine = {
	{
		ViMode,
		utils.surround({ "", "" }, "bright_bg", FilePath),
	},
	layouts.Align,
	{
		-- 	debugger.DAPMessages,
		-- 	layouts.Space,
		ornaments.LSPActive,
		ornaments.GitBranch,
	},
}

-- setup heirline
require("heirline").setup({
	opts = {
		colors = require("configs.heirline.setup_colors")(),
	},
	statusline = StatusLine,
})
