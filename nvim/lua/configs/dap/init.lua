require("configs.dap.highlight")

-- load all files in the cfgs directory
local filelist = vim.fn.readdir(vim.fn.expand("~/.config/nvim/lua/configs/dap/cfgs"))
for _, fname in ipairs(filelist) do
	local path = "configs.dap.cfgs." .. fname:gsub(".lua", "")
	local ok, _ = pcall(require, path)
	if not ok then
		vim.notify("Error loading: " .. path, vim.log.levels.ERROR)
	end
end
