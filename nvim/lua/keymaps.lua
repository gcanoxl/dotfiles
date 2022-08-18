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

-- Buffer Line
-- TODO: add descriptions
geem.map_ncl('1', 'BufferLineGoToBuffer 1')
geem.map_ncl('2', 'BufferLineGoToBuffer 2')
geem.map_ncl('3', 'BufferLineGoToBuffer 3')
geem.map_ncl('4', 'BufferLineGoToBuffer 4')
geem.map_ncl('5', 'BufferLineGoToBuffer 5')
geem.map_ncl('6', 'BufferLineGoToBuffer 6')
geem.map_ncl('7', 'BufferLineGoToBuffer 7')
geem.map_ncl('8', 'BufferLineGoToBuffer 8')
geem.map_ncl('9', 'BufferLineGoToBuffer 9')
geem.map_ncl('0', 'BufferLineGoToBuffer 10')
geem.map_nc('}', 'BufferLineCycleNext')
geem.map_nc('{', 'BufferLineCyclePrev')

-- Neo Tree
geem.map_ncl('fl', 'Neotree', 'File Explorer')

-- auto mapping
for mode, maps in pairs(geem.map_table) do
	for keymap, options in pairs(maps) do
		vim.api.nvim_set_keymap(mode, keymap, options.cmd,
			{ noremap = true, silent = true })
	end
end
