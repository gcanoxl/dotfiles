local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
	return
end

dap.adapters.dart = {
	type = "executable",
	-- As of this writing, this functionality is open for review in https://github.com/flutter/flutter/pull/91802
	command = "flutter",
	args = { "debug_adapter" }
}
dap.configurations.dart = {
	-- {
	-- 	type = "dart",
	-- 	request = "launch",
	-- 	name = "Launch Flutter Program",
	-- 	-- The nvim-dap plugin populates this variable with the filename of the current buffer
	-- 	program = "./lib/main.dart",
	-- 	-- The nvim-dap plugin populates this variable with the editor's current working directory
	-- 	cwd = "${workspaceFolder}",
	-- 	-- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
	-- 	toolArgs = { "-d", "51199BE2" }
	-- }
}
