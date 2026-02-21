local M = {}

function M.setup(_, deps)
	deps.commanding.register("Reload Hammerspoon", hs.reload, "Reload current Hammerspoon config")
end

return M
