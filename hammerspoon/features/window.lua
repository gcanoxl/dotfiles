local M = {}

function M.setup()
	hs.hotkey.bind({ "cmd", "ctrl" }, "return", function()
		local window = hs.window.focusedWindow()
		window:toggleFullScreen()
	end)
end

return M
