return {
	'glepnir/dashboard-nvim',
	event = 'VimEnter',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('dashboard').setup {
			change_to_vcs_root = true,
		}
	end,
}
