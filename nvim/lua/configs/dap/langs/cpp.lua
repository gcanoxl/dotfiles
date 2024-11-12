local dap = require("dap")

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		-- CHANGE THIS to your path!
		command = "codelldb",
		args = { "--port", "${port}" },

		-- On windows you may have to uncomment this:
		-- detached = false,
	},
}
dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "OpenDebugAD7",
	options = {
		detached = false,
	},
}

dap.configurations.cpp = {
	{
		name = "codelldb",
		type = "codelldb",
		request = "launch",
		program = function()
			-- compile first
			local filename = vim.fn.expand("%")
			local program = vim.fn.getcwd() .. "/" .. vim.fn.expand("%:r")
			vim.fn.system("g++ " .. filename .. " -o " .. program)
			return program
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
	{
		name = "lldb",
		type = "cppdbg",
		request = "launch",
		MIMode = "lldb",
		-- miDebuggerServerAddress = "localhost:1234",
		-- miDebuggerPath = "lldb",
		program = function()
			local filename = vim.fn.expand("%")
			local program = vim.fn.getcwd() .. "/" .. vim.fn.expand("%:r")
			vim.fn.system("g++ " .. filename .. " -o " .. program)
			return program
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = false,
	},
}

dap.configurations.c = dap.configurations.cpp
