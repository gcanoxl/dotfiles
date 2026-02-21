local M = {}

function M.setup(config, deps)
	for _, binding in ipairs(config.bindings) do
		deps.utils.bindForApp(binding.includes, binding.keymaps)
	end
end

return M
