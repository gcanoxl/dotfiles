local M = {}

---Get the current URL of the frontmost tab of the frontmost window
---@return string | nil
function M.getCurrentURL()
	local _, url =
		hs.osascript.applescript('tell application "Brave Browser" to return URL of active tab of front window')
	return url
end

---Get the domain of a URL
---@param url string
---@return string | nil
function M.getDomain(url)
	local domain = string.match(url, "https?://([^/]+)")
	if domain == nil then
		domain = string.match(url, "http?://([^/]+)")
	end
	-- only keep the last two parts of the domain
	domain = string.match(domain, "([^%.]+%.[^%.]+)$")
	return domain
end

--- Bind keymaps for specific apps
---@param includes string[] List of app names
---@param keymaps {mods: string[], key: string, fn: string | function}[] List of keymaps
function M.bindForApp(includes, keymaps)
	local function getFnByKey(key)
		return function()
			hs.eventtap.keyStroke(nil, key)
		end
	end

	local watcher = hs.application.watcher.new(function(appName, event, _)
		if event == hs.application.watcher.deactivated then
			if hs.fnutils.contains(includes, appName) then
				for _, keybind in ipairs(keymaps) do
					hs.hotkey.deleteAll(keybind.mods, keybind.key)
				end
			end
		end

		if event == hs.application.watcher.activated then
			if hs.fnutils.contains(includes, appName) then
				for _, keybind in ipairs(keymaps) do
					if type(keybind.fn) == "string" then
						keybind.fn = getFnByKey(keybind.fn)
					end
					hs.hotkey.bind(keybind.mods, keybind.key, keybind.fn)
				end
			end
		end
	end)
	watcher:start()
end

return M
