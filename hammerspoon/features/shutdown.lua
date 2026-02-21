local M = {}

function M.setup(cleanups)
	local previousShutdownCallback = hs.shutdownCallback

	hs.shutdownCallback = function()
		for _, cleanup in ipairs(cleanups) do
			if type(cleanup) == "function" then
				cleanup()
			end
		end

		if type(previousShutdownCallback) == "function" then
			previousShutdownCallback()
		end
	end
end

return M
