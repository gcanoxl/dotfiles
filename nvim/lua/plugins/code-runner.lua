local code_runner_avail, code_runner = pcall(require, 'code_runner');
if not code_runner_avail then return end

code_runner.setup({
	focus = false,
	term = {
		position = "belowright",
		size = 8,
	},
	filetype = {
		python = "python3 -u",
		c = "gcc $fileName && ./a.out"
	}
})
