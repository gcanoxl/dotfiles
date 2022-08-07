-- TODO: refactor this file

local map_table = { n = {}, i = {}, v = {}, s = {} }

local function map_n(key, cmd, desc)
	map_table.n[key] = { cmd = cmd, desc = desc }
end

local function map_n_command(key, command, desc)
	map_n(key, '<CMD>' .. command .. '<CR>', desc)
end

local function map_n_command_leader(key, command, desc)
	map_n_command('<LEADER>' .. key, command, desc)
end

local function map_i(key, cmd, desc)
	map_table.i[key] = { cmd = cmd, desc = desc }
end

--keymaps

map_i('jk', '<ESC>', 'Quit Insert Mode')
map_n_command_leader('fw', 'write', 'Save File')
map_n_command('<D-s>', 'write', 'Save File')
map_n_command_leader('qq', 'quit', "Quit")

-- auto mapping
for mode, maps in pairs(map_table) do
	for keymap, options in pairs(maps) do
		-- TODO: implement mapping
	end
end
