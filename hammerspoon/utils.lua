local M = {}

function M.inspect(o, depth)
	if not depth then depth = 1 end
	if type(o) == 'table' then
		local s = '{\n'
		for k, v in pairs(o) do
			s = s .. string.rep('\t', depth)
			if type(k) ~= 'number' then k = '"' .. k .. '"' end
			s = s .. '[' .. k .. '] = ' .. M.inspect(v, depth + 1) .. ',\n'
		end
		return s .. string.rep('\t', depth - 1) .. '} '
	else
		return tostring(o)
	end
end

return M
