-- configuration reloading
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- toggle fullscreene
hs.hotkey.bind({ 'cmd', 'ctrl' }, 'return', function()
	local window = hs.window.focusedWindow()
	window:toggleFullScreen()
end)
-- TODO: auto subscribling
