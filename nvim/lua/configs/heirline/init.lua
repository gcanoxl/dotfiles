local ViMode = require("configs.heirline.components.vi_mode")
local fs = require("configs.heirline.components.fs")
local ornaments = require("configs.heirline.components.ornaments")
local layouts = require("configs.heirline.components.layouts")
local debugger = require("configs.heirline.components.debugger")

local cloc = require("configs.heirline.components.cloc")
local daily_code = require("configs.heirline.components.dailycode")

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
		daily_code,
		layouts.Space,
		cloc,

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
