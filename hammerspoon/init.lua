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

local arrowTriggerMods = { "cmd", "ctrl" }
local keyRepeatInitialDelaySeconds = 0.18
local keyRepeatIntervalSeconds = 0.03
local keyboardEventAutorepeat = hs.eventtap.event.properties.keyboardEventAutorepeat
local commandControlWASDToArrows = {
	{ key = "w", arrow = "up" },
	{ key = "a", arrow = "left" },
	{ key = "s", arrow = "down" },
	{ key = "d", arrow = "right" },
}
local arrowHoldStates = {}

local function postArrowEvent(arrow, isDown, isRepeat)
	local event = hs.eventtap.event.newKeyEvent({}, arrow, isDown)
	if isDown and isRepeat then
		event:setProperty(keyboardEventAutorepeat, 1)
	end
	event:post()
end

local function stopTimer(timer)
	if timer ~= nil then
		timer:stop()
	end
end

local function releaseAllHeldArrows()
	for _, state in pairs(arrowHoldStates) do
		stopTimer(state.delayTimer)
		stopTimer(state.repeatTimer)
		state.delayTimer = nil
		state.repeatTimer = nil
		if state.isHeld then
			postArrowEvent(state.arrow, false, false)
			state.isHeld = false
		end
	end
end

for _, mapping in ipairs(commandControlWASDToArrows) do
	local state = {
		arrow = mapping.arrow,
		isHeld = false,
		delayTimer = nil,
		repeatTimer = nil,
	}
	arrowHoldStates[mapping.key] = state

	local function stopTimers()
		stopTimer(state.delayTimer)
		stopTimer(state.repeatTimer)
		state.delayTimer = nil
		state.repeatTimer = nil
	end

	local function onPressed()
		if state.isHeld then
			return
		end

		state.isHeld = true
		postArrowEvent(state.arrow, true, false)

		state.delayTimer = hs.timer.doAfter(keyRepeatInitialDelaySeconds, function()
			if not state.isHeld then
				return
			end

			state.repeatTimer = hs.timer.doEvery(keyRepeatIntervalSeconds, function()
				if not state.isHeld then
					return
				end
				postArrowEvent(state.arrow, true, true)
			end)
		end)
	end

	local function onReleased()
		stopTimers()
		if not state.isHeld then
			return
		end
		postArrowEvent(state.arrow, false, false)
		state.isHeld = false
	end

	hs.hotkey.bind(arrowTriggerMods, mapping.key, onPressed, onReleased)
end

local previousShutdownCallback = hs.shutdownCallback
hs.shutdownCallback = function()
	releaseAllHeldArrows()
	if type(previousShutdownCallback) == "function" then
		previousShutdownCallback()
	end
end

-- TODO: improve its stability
-- local utils = require("utils")
-- utils.bindForApp({ "Brave Browser" }, {
-- 	{
-- 		mods = nil,
-- 		key = "w",
-- 		fn = function()
-- 			local type = hs.mouse.currentCursorType()
-- 			hs.alert.show(type)
-- 			hs.alert.show(type == "IBeamCursor")
-- 			if type ~= "IBeamCursor" then
-- 				hs.eventtap.keyStroke(nil, "up")
-- 			end
-- 		end,
-- 	},
-- })

-- local utils = require("utils")
-- utils.bindForApp({ "Photos" }, {
-- 	{
-- 		mods = nil,
-- 		key = "h",
-- 		fn = function()
-- 			print("h")
-- 			hs.eventtap.keyStroke(nil, "left")
-- 		end,
-- 	},
-- 	{
-- 		mods = nil,
-- 		key = "l",
-- 		fn = function()
-- 			hs.eventtap.keyStroke(nil, "right")
-- 		end,
-- 	},
-- })
