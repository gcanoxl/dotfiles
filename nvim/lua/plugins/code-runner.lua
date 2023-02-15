local code_runner_avail, code_runner = pcall(require, 'code_runner');
if not code_runner_avail then return end

code_runner.setup({})
