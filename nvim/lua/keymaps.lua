-- TODO: refactor this file
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opts = { noremap = true, silent = true }

local nomap = {
	i = function(key, result)
		vim.api.nvim_set_keymap('i', key, result, opts)
	end,

	ic = function(key, result)
		vim.api.nvim_set_keymap('i', key, '<CMD>' .. result .. '<CR>', opts)
	end,

	n = function(key, result)
		vim.api.nvim_set_keymap('n', key, result, opts)
	end,

	nc = function(key, result)
		vim.api.nvim_set_keymap('n', key, '<CMD>' .. result .. '<CR>', opts)
	end,

	ln = function(key, result)
		vim.api.nvim_set_keymap('n', '<leader>' .. key, result, opts)
	end,

	lnc = function(key, result)
		vim.api.nvim_set_keymap('n', '<LEADER>' .. key, '<CMD>' .. result .. '<CR>', opts)
	end,

	v = function(key, result)
		vim.api.nvim_set_keymap('v', key, result, opts)
	end,

	vc = function(key, result)
		vim.api.nvim_set_keymap('v', key, '<CMD>' .. result .. '<CR>', opts)
	end,

	s = function(key, result)
		vim.api.nvim_set_keymap('s', key, result, opts)
	end,

	sc = function(key, result)
		vim.api.nvim_set_keymap('s', key, '<CMD>' .. result .. '<CR>', opts)
	end,
}
nomap.i('jk', '<ESC>')
nomap.lnc('fw', 'write')
nomap.nc('<D-s>', 'write')
nomap.lnc('qq', 'quitall')

return nomap
