-- configuration reloading
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- toggle fullscreene
hs.hotkey.bind({ 'cmd', 'ctrl' }, 'return', function()
	local window = hs.window.focusedWindow()
	window:toggleFullScreen()
end)

-- window layout for developing
local laptopScreen = "developing"
local windowLayout = {
	{ "Neovide", nil, laptopScreen, { x = 0, y = 0, w = 0.73, h = 1 }, nil, nil },
}
hs.hotkey.bind({ 'cmd', 'ctrl' }, 'd', function()
	hs.layout.apply(windowLayout)
end)
