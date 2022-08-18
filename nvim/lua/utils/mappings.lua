function geem.map_n(key, cmd, desc)
	geem.map_table.n[key] = { cmd = cmd, desc = desc }
end

function geem.map_n_command(key, command, desc)
	geem.map_n(key, '<CMD>' .. command .. '<CR>', desc)
end

function geem.map_ncl(key, command, desc)
	geem.map_n_command('<LEADER>' .. key, command, desc)
end

function geem.map_i(key, cmd, desc)
	geem.map_table.i[key] = { cmd = cmd, desc = desc }
end
