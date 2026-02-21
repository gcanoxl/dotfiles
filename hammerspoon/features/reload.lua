local M = {}

function M.setup()
	hs.loadSpoon("ReloadConfiguration")
	spoon.ReloadConfiguration:start()
end

return M
