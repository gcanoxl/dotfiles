-- TODO: implement
-- local filetypes_dir = vim.fn.stdpath('config') .. '/lua/plugins/nvim-dap/filetypes'
--
-- local globpath = vim.fn.globpath
-- local split = vim.fn.split
--
-- local filetypes = split(globpath(filetypes_dir, '*.lua'), '\n')

require('plugins.nvim-dap.filetypes.dart')

local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then
	return
end
dapui.setup()
