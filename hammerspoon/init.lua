-- configuration reloading
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- toggle fullscreene
hs.hotkey.bind({ "cmd", "ctrl" }, "return", function()
	local window = hs.window.focusedWindow()
	window:toggleFullScreen()
end)

local mash = { "ctrl", "cmd" }
-- SplitView for Split Screen
hs.spoons.use("SplitView", {
	config = { tileSide = "left" },
	hotkeys = {
		choose = { mash, "o" },
	},
})

local applicationHotkeys = {
	["1"] = "kitty",
	["2"] = "Brave Browser",
	["3"] = "Dictionary",
}

for key, app in pairs(applicationHotkeys) do
	hs.hotkey.bind("ctrl", key, function()
		hs.application.launchOrFocus(app)
	end)
end
