local ok, cloc = pcall(require, "cloc")
if not ok then
	vim.notify("Could not load Cloc.nvim", vim.log.levels.ERROR)
end

local Cloc = {
	provider = function(self)
		local status = cloc.get_status()
		if status.statusCode == "loading" then
			return "Clocing..."
		end
		if status.statusCode == "error" then
			return "Error"
		end
		return status.data[1].code
	end,
}
return Cloc
