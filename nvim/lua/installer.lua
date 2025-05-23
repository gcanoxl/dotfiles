local function initialize_lazy()
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

initialize_lazy()

require("lazy").setup({
	{ import = "plugins" },
}, {
	dev = {
		path = "~/Developer/",
		patterns = jit.os == "OSX" and { "gcanoxl" } or {},
	},
})
