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

require('lazy').setup({
	{
		"gcanoxl/dart-const-organizer.nvim",
		config = function()
			require('dart-const-organizer').setup()
			-- reload only for development
			-- vim.keymap.set('n', '<leader>r',
			-- 	function()
			-- 		package.loaded['dart-const-organizer'] = nil
			-- 		require('dart-const-organizer').setup()
			-- 	end,
			-- 	{ noremap = true }
			-- )
		end
	},
	{ import = "plugins" }
}, {
	dev = {
		path = "~/Projects"
	},
})
