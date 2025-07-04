local group = vim.api.nvim_create_augroup("autocmds.templating", { clear = true })

---@class autocmds.templating.Opts.PatternOpts
---@field enable? boolean|fun():boolean
---@field path? string|(fun():string)

---@alias autocmds.templating.Opts.Pattern table<string, autocmds.templating.Opts.PatternOpts>

---@class autocmds.templating.Opts
---@field templates_path string|fun():string
---@field filetypes table<string, table<string>|string>
---@field patterns? table<string, autocmds.templating.Opts.Pattern>
---@field variables? table<string, autocmds.templating.VariableCallback|string>

---@class autocmds.templating.VariableCallbackContext
---@field filetype? string
---@field buf? number

---@alias autocmds.templating.VariableCallback fun(ctx: autocmds.templating.VariableCallbackContext):string

---@type autocmds.templating.Opts
local defaults = {
	templates_path = vim.fn.stdpath("config") .. "/templates",
	filetypes = {
		swift = ".swift",
	},
	patterns = {
		swift = {
			View = {},
		},
	},
	variables = {
		FileName = function()
			return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t:r")
		end,
		ProjectName = function(ctx)
			ctx = ctx or {}
			local fullpath = vim.fs.root(vim.api.nvim_buf_get_name(ctx.buf or 0), { ".project", ".git" })
			if ctx.filetype and ctx.filetype == "swift" then
				local ok, config = pcall(require, "xcodebuild.project.config")
				if ok then
					local workingDirectory = config.settings.workingDirectory
					fullpath = workingDirectory and workingDirectory or fullpath
				end
			end
			-- get the last directory
			local ret = (fullpath or ""):match(".*[/\\](.*)")
			return ret
		end,
		Author = "Cano XL",
		Date = function()
			local ret = os.date("%Y/%m/%d") ---@cast ret string
			return ret
		end,
	},
}

---@param filetype string
---@param pattern string
---@param exts string[]
---@return string | nil
local function default_template_path(filetype, pattern, exts)
	for _, ext in pairs(exts) do
		local path = defaults.templates_path .. "/" .. filetype .. "/" .. pattern .. ext
		if vim.fn.filereadable(path) == 1 then
			return path
		end
	end
end

---@param template any
---@param data table<string, string>
---@return string[]
local function render_template(template, data)
	-- TODO: precompile
	-- render template
	local lines = {}
	for _, line in pairs(template) do
		for k, v in pairs(data) do
			line = line:gsub("{{" .. k .. "}}", v)
		end
		table.insert(lines, line)
	end
	return lines
end

for filetype, _ in pairs(defaults.patterns or {}) do
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = filetype,
		callback = function(args)
			local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)

			-- not a new file
			if #lines < 1 or lines[1] ~= "" then
				return
			end

			-- get file extensions
			local exts = defaults.filetypes[filetype]
			exts = type(exts) == "string" and { exts } or exts ---@cast exts string[]

			-- get filenames
			local filename = nil
			for _, ext in pairs(exts) do
				filename = args.file:match("([^/]*)%" .. ext)
				if filename then
					break
				end
			end

			for pattern, value in pairs(defaults.patterns[filetype]) do
				if filename:match(pattern) then
					local enable = type(value.enable) == "function" and value.enable() or value.enable or true
					if not enable then
						goto continue
					end
					local path = type(value.path) == "function" and value.path()
						or value.path
						or default_template_path(filetype, pattern, exts)
					---@cast path string|nil
					if path == nil then
						goto continue
					end
					if path == "" then
						vim.notify("Template path is empty", vim.log.levels.ERROR)
						goto continue
					end
					if not vim.fn.filereadable(path) then
						vim.notify("Template path is unreadable: " .. path, vim.log.levels.ERROR)
						goto continue
					end

					-- load template
					local template = vim.fn.readfile(path)

					-- init variables
					local variables = defaults.variables or {}
					---@type table<string, string>
					local data = {}
					for name, val in pairs(variables) do
						---@cast val string|autocmds.templating.VariableCallback
						local v = type(val) == "function" and val({ filetype = filetype, buf = args.buf }) or val or "" ---@cast v string
						data[name] = v
					end
					local rendered = render_template(template, data)
					-- render
					vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, rendered)
				end
				::continue::
			end
		end,
	})
end
