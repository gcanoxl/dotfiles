---@type vim.lsp.Config
local function get_python_path(workspace)
	local uv = vim.uv or vim.loop
	local function exists(path)
		return uv.fs_stat(path) ~= nil
	end

	-- Prefer project-local virtual environments first.
	local candidates = {
		workspace .. "/.venv/bin/python",
		workspace .. "/venv/bin/python",
	}
	for _, path in ipairs(candidates) do
		if exists(path) then
			return path
		end
	end

	-- Fallback to the system interpreter.
	local system_python = vim.fn.exepath("python3")
	if system_python ~= "" then
		return system_python
	end
	return "python3"
end

return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	-- Python project markers plus shared root markers (includes .project/.git).
	root_markers = vim.list_extend({
		"pyproject.toml",
		"uv.lock",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
	}, vim.deepcopy(core.configs.root_markers)),
	before_init = function(_, config)
		if not config.root_dir then
			return
		end

		-- Ensure nested settings tables exist before injecting runtime values.
		config.settings = config.settings or {}
		config.settings.python = config.settings.python or {}

		-- Force pyright to analyze against the project interpreter.
		local python_path = get_python_path(config.root_dir)
		config.settings.python.pythonPath = python_path

		-- Hint pyright about local .venv for import/type resolution.
		if (vim.uv or vim.loop).fs_stat(config.root_dir .. "/.venv") then
			config.settings.python.venvPath = config.root_dir
			config.settings.python.venv = ".venv"
		end
	end,
	settings = {
		python = {
			analysis = {
				-- Balanced default: useful checks without strict mode noise.
				typeCheckingMode = "basic",
				-- Auto-detect common import roots in the workspace.
				autoSearchPaths = true,
				-- Use third-party library source when stubs are missing.
				useLibraryCodeForTypes = true,
				-- Build symbol index for faster navigation/search.
				indexing = true,
				-- Report diagnostics for the whole project.
				diagnosticMode = "workspace",
				-- Offer import suggestions in completion items.
				autoImportCompletions = true,
			},
		},
	},
}
