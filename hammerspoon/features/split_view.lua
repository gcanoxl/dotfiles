local M = {}

function M.setup(config)
	hs.spoons.use("SplitView", {
		config = config.config,
		hotkeys = config.hotkeys,
	})
end

return M
