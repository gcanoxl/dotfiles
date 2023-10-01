_G.geem = {}

geem.map_table = { n = {}, i = {}, v = {}, s = {} }

function geem.cmd(cmd)
	return "<cmd>" .. cmd .. "<cr>"
end

function geem.map_on_filetype(filetype, maps)
	vim.api.nvim_create_autocmd('FileType', {
		pattern = filetype,
		group = vim.api.nvim_create_augroup('mapping' .. filetype, { clear = true }),
		callback = function()
			local buf = vim.api.nvim_get_current_buf()
			require('which-key').register(maps, { prefix = "<localleader>", buffer = buf })
		end
	})
end

function geem.move_to_new_tab()
	local win_id = vim.fn.win_getid()
	vim.cmd('tab split')
	vim.fn.win_execute(win_id, 'wincmd c')
end
