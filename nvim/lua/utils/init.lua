_G.geem = {}

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
