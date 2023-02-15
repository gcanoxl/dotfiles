_G.geem = {}

geem.map_table = { n = {}, i = {}, v = {}, s = {} }

function geem.initialize_lazy()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end

function geem.cmd(cmd)
	return "<cmd>" .. cmd .. "<cr>"
end
