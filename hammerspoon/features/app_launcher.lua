local M = {}

function M.setup(config)
	for key, app in pairs(config.hotkeys) do
		hs.hotkey.bind("ctrl", key, function()
			hs.application.launchOrFocus(app)
		end)
	end
end

return M
