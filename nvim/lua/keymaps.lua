-- leader
vim.g.mapleader = ' '

--keymaps

-- General
geem.map_i('jk', '<ESC>', 'Quit Insert Mode')
geem.map_ncl('fw', 'write', 'Save File')
geem.map_ncl('qq', 'quit', "Quit")

-- Packer
geem.map_ncl('pi', 'PackerInstall', 'Package Install')
geem.map_ncl('pc', 'PackerCompile', 'Package Compile')
geem.map_ncl('pC', 'PackerClean', 'Package Clean')
geem.map_ncl('pu', 'PackerSync', 'Package Update')
geem.map_ncl('pl', 'PackerStatus', 'Package Status')

-- Hop
geem.map_ncl('f', 'HopChar1')

-- BufferLine
-- TODO: install which key
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

-- Luasnip
geem.map_ic('<S-Tab>', [[lua require'luasnip'.jump(-1)]])
geem.map_sc('<Tab>', [[lua require'luasnip'.jump(1)]])
geem.map_sc('<S-Tab>', [[lua require'luasnip'.jump(-1)]])

-- Neogit
geem.map_ncl('gg', 'Neogit')

-- SessionManager
geem.map_ncl('pR', 'SessionManager load_last_session')
geem.map_ncl('pf', 'SessionManager load_session')
geem.map_ncl('ps', 'SessionManager save_current_session')
geem.map_ncl('pd', 'SessionManager delete_session')

-- Bufdelete
geem.map_nc('<C-w>c', 'lua require"bufdelete".bufdelete(0, false)')

-- Telescope
geem.map_nc('<C-f>', 'Telescope buffers')
geem.map_ncl('<leader>', 'Telescope commands')
geem.map_ncl('bb', 'Telescope buffers')
geem.map_ncl('ff', 'Telescope find_files')
geem.map_ncl('fr', 'Telescope oldfiles')
geem.map_ncl('ss', 'Telescope live_grep')
geem.map_ncl('hh', 'Telescope help_tags')

-- TodoList
geem.map_ncl('ts', 'TodoTelescope')
geem.map_ncl('tt', 'TodoQuickFix')

-- Terminal
geem.map_nc('!', 'ToggleTerm')

-- END
geem.map_mappings()
