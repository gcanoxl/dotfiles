return {
	name = "OI C++ Build and Run",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "sh" },
			args = {
				"-c",
				"g++ '" .. file .. "' -o /tmp/a.out && /tmp/a.out",
			},
			components = {
				{ "on_output_quickfix", open = true },
				{ "timeout", seconds = 5 },
				"default",
			},
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
