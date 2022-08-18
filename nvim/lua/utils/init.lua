_G.geem = {}

geem.map_table = { n = {}, i = {}, v = {}, s = {} }

function geem.initialize_packer()
	local packer_avail, _ = pcall(require, 'packer')
	if not packer_avail then
		local packer_path = vim.fn.stdpath('data') ..
				'/site/pack/packer/start/packer.nvim'
		vim.fn.delete(packer_path, 'rf')
		vim.fn.system({
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			packer_path
		})
		vim.cmd "packadd packer.nvim"
		packer_avail, _ = pcall(require, "packer")
	end
	return packer_avail
end

-- mapping
function geem.map_n(key, cmd, desc)
	geem.map_table.n[key] = { cmd = cmd, desc = desc }
end

function geem.map_i(key, cmd, desc)
	geem.map_table.i[key] = { cmd = cmd, desc = desc }
end

function geem.map_s(key, cmd, desc)
	geem.map_table.s[key] = { cmd = cmd, desc = desc }
end

function geem.map_nc(key, command, desc)
	geem.map_n(key, '<CMD>' .. command .. '<CR>', desc)
end

function geem.map_ic(key, command, desc)
	geem.map_i(key, '<CMD>' .. command .. '<CR>', desc)
end

function geem.map_sc(key, command, desc)
	geem.map_s(key, '<CMD>' .. command .. '<CR>', desc)
end

function geem.map_ncl(key, command, desc)
	geem.map_nc('<LEADER>' .. key, command, desc)
end

function geem.map_mappings()
	for mode, maps in pairs(geem.map_table) do
		for keymap, options in pairs(maps) do
			vim.api.nvim_set_keymap(mode, keymap, options.cmd,
				{ noremap = true, silent = true })
		end
	end
end
