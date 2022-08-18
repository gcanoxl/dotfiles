local map_table = { n = {}, i = {}, v = {}, s = {} }

-- leader
vim.g.mapleader = ' '

--keymaps

-- General
geem.map_i('jk', '<ESC>', 'Quit Insert Mode')
geem.map_ncl('fw', 'write', 'Save File')
geem.map_ncl('qq', 'quit', "Quit")

-- Packer
geem.map_ncl('pi', 'PackerInstall', 'Package Install')
geem.map_ncl('pc', 'PackerClean', 'Package Clean')
geem.map_ncl('pu', 'PackerSync', 'Package Update')
geem.map_ncl('pl', 'PackerStatus', 'Package Status')

-- auto mapping
for mode, maps in pairs(map_table) do
	for keymap, options in pairs(maps) do
		vim.api.nvim_set_keymap(mode, keymap, options.cmd,
			{ noremap = true, silent = true })
	end
end
