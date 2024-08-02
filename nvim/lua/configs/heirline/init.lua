local ViMode = require("configs.heirline.components.vi_mode")
local fs = require("configs.heirline.components.fs")
local ornaments = require("configs.heirline.components.ornaments")
local layouts = require("configs.heirline.components.layouts")
local debugger = require("configs.heirline.components.debugger")

local StatusLine = {
	{
		ViMode,
		layouts.Space,
		fs.WorkDir,
		fs.FileNameBlock,
	},
	layouts.Align,
	{
		debugger.DAPMessages,
		layouts.Space,
		ornaments.Copilot,
		layouts.Space,
		ornaments.LSPActive,
		layouts.Space,
		ornaments.Git,
	},
}

-- setup heirline
require("heirline").setup({
	opts = {
		colors = require("configs.heirline.setup_colors")(),
	},
	statusline = StatusLine,
})
