local ok, dc = pcall(require, "dailycode")
if not ok then
	vim.notify("Could not load daily-code.nvim", vim.log.levels.ERROR)
end

local Cloc = {
	-- update = { "User", pattern = "ClocStatusUpdated" },
	provider = function(_)
		return dc.live_widget()
	end,
}
return Cloc
