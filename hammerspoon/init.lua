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

-- open terminal by cmd + `
hs.hotkey.bind({ 'cmd' }, '`', function()
	hs.application.launchOrFocus('iterm')
end)

-- open browser by cmd + 1
hs.hotkey.bind({ 'cmd' }, '1', function()
	hs.application.launchOrFocus('brave browser')
end)

-- open code editor by cmd + 2
hs.hotkey.bind({ 'cmd' }, '2', function()
	hs.application.launchOrFocus('neovide')
end)

-- open browser by cmd + 3
hs.hotkey.bind({ 'cmd' }, '3', function()
	hs.application.launchOrFocus('QQ')
end)

-- open browser by cmd + 4
hs.hotkey.bind({ 'cmd' }, '4', function()
	hs.application.launchOrFocus('wechat')
end)
