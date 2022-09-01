-- configuration reloading
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- toggle fullscreene
hs.hotkey.bind({ 'cmd' }, 'return', function()
	local window = hs.window.focusedWindow()
	window:setFullscreen(not window:isFullscreen())
end)

-- TODO: auto subscribling
