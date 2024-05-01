local root_files = { 'init.lua' }

local paths = vim.fs.find(root_files, { stop = vim.env.HOME, upward = true })

local root_dir = vim.fs.dirname(paths[1])

if root_dir then
	vim.lsp.start({
		cmd = { 'lua-language-server' },
		root_dir = root_dir,
	})
end

vim.diagnostic.config(
{
	signs = false


})


vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')


