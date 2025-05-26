return {
	name = "OI C++ Build and Run",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "sh" },
			args = {
				"-c",
				"g++ '" .. file .. "' -o a.out && ./a.out && rm a.out",
			},
			components = {
				{ "on_output_quickfix", open = true },
				{ "on_complete_notify", statuses = {} },
				{ "timeout", timeout = 5 },
				"default",
			},
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
