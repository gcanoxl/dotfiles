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
function geem.map_n(key, cmd)
	geem.map_table.n[key] = { cmd = cmd }
end

function geem.map_i(key, cmd)
	geem.map_table.i[key] = { cmd = cmd }
end

function geem.map_s(key, cmd)
	geem.map_table.s[key] = { cmd = cmd }
end

function geem.map_v(key, cmd)
	geem.map_table.v[key] = { cmd = cmd }
end

function geem.map_nc(key, command)
	geem.map_n(key, '<CMD>' .. command .. '<CR>')
end

function geem.map_ic(key, command)
	geem.map_i(key, '<CMD>' .. command .. '<CR>')
end

function geem.map_sc(key, command)
	geem.map_s(key, '<CMD>' .. command .. '<CR>')
end

function geem.map_vc(key, command)
	geem.map_v(key, '<CMD>' .. command .. '<CR>')
end

function geem.map_ncl(key, command)
	geem.map_nc('<LEADER>' .. key, command)
end

function geem.map_mappings()
	for mode, maps in pairs(geem.map_table) do
		for keymap, options in pairs(maps) do
			vim.api.nvim_set_keymap(mode, keymap, options.cmd,
				{ noremap = true, silent = true, nowait = true })
		end
	end
end
