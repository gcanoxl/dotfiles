vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opts = {noremap = true, silent = true}

local nomap = {
	i = function(key, result)
		vim.api.nvim_set_keymap('i', key, result, opts)
	end, 

	n = function(key, result)
		vim.api.nvim_set_keymap('n', key, result, opts)
	end,

	ln = function(key, result)
		vim.api.nvim_set_keymap('n', '<leader>'..key, result, opts)
	end
}
nomap.i('jk', '<ESC>')
nomap.ln('fw', ':write<CR>')
nomap.ln('qq', ':quitall<CR>')

return nomap
