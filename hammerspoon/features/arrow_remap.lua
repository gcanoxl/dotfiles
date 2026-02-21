local M = {}

local keyboardEventAutorepeat = hs.eventtap.event.properties.keyboardEventAutorepeat

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

function M.setup(config)
	local arrowHoldStates = {}
	local repeatConfig = config.repeatConfig
	local mods = config.mods
	local mappings = config.mappings

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

	for _, mapping in ipairs(mappings) do
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

			state.delayTimer = hs.timer.doAfter(repeatConfig.initialDelaySeconds, function()
				if not state.isHeld then
					return
				end

				state.repeatTimer = hs.timer.doEvery(repeatConfig.intervalSeconds, function()
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

		hs.hotkey.bind(mods, mapping.key, onPressed, onReleased)
	end

	return releaseAllHeldArrows
end

return M
