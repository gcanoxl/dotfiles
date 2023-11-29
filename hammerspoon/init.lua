-- configuration reloading
hs.loadSpoon("ReloadConfiguration")
---@diagnostic disable-next-line: undefined-global
spoon.ReloadConfiguration:start()

-- toggle fullscreene
hs.hotkey.bind({ 'cmd', 'ctrl' }, 'return', function()
	local window = hs.window.focusedWindow()
	window:toggleFullScreen()
end)

local mash = { "ctrl", "cmd" }
-- SplitView for Split Screen
hs.spoons.use("SplitView",
	{
		config = { tileSide = "left" },
		hotkeys = {
			choose = { mash, "o" },
		}
	}
)
