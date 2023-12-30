local ViMode = require("configs.heirline.components.vi_mode")
local fs = require("configs.heirline.components.fs")
local ornaments = require("configs.heirline.components.ornaments")
local layouts = require("configs.heirline.components.layouts")

local StatusLine = {
	{
		ViMode,
		layouts.Space,
		fs.WorkDir,
		fs.FileNameBlock,
	},
	layouts.Align,
	{
		ornaments.LSPActive,
		layouts.Space,
		ornaments.Git,
		layouts.Space,
		ornaments.Copilot,
	},
}

-- setup heirline
require("heirline").setup({
	opts = {
		colors = require("configs.heirline.setup_colors")(),
	},
	statusline = StatusLine,
})
