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

-- auto close/open dapui and set keybindings
local dap = require("dap")
local dapui = require("dapui")

local opts = { noremap = true, silent = true }

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
	vim.keymap.set("n", "c", dap.continue, opts)
	vim.keymap.set("n", "n", dap.step_into, opts)
	vim.keymap.set("n", "N", dap.step_over, opts)
	vim.keymap.set("n", "o", dap.step_out, opts)
	vim.keymap.set("n", "q", dap.terminate, opts)
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()

	vim.keymap.del("n", "c", opts)
	vim.keymap.del("n", "n", opts)
	vim.keymap.del("n", "N", opts)
	vim.keymap.del("n", "o", opts)
	vim.keymap.del("n", "q", opts)
end
