return {
	'ray-x/go.nvim',
	dependencies = { 'ray-x/guihua.lua' },
	ft = { 'go' },
	config = function()
		require('go').setup()

		-- Run gofmt + goimport on save
		vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
	end
}
