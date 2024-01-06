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

return M
