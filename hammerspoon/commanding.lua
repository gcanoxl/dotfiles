local M = {}

local commands = {}

---Register a command
---@param name string
---@param fn function
---@param description string
function M.register(name, fn, description)
	commands[#commands + 1] = {
		name = name,
		fn = fn,
		description = description or "",
	}
end

---Display the command chooser
function M.display()
	local chooser = hs.chooser.new(function(choice)
		if not choice then
			return
		end
		commands[choice.id]["fn"]()
	end)

	chooser:choices(hs.fnutils.imap(commands, function(command)
		return {
			text = command.name,
			subText = command.description,
			id = hs.fnutils.indexOf(commands, command),
		}
	end))
	chooser:show()
end

return M
