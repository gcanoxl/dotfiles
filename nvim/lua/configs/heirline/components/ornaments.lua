local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local LSPActive = {
	condition = conditions.lsp_attached,
	update = { "LspAttach", "LspDetach" },
	provider = function()
		local names = {}
		for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
			table.insert(names, server.name)
		end
		return "[" .. table.concat(names, " ") .. "]"
	end,
	hl = { fg = "green", bold = true },
}

local Git = {
	condition = conditions.is_git_repo,
	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
	end,
	hl = { fg = "orange", bold = true },

	-- git branch name
	{
		provider = function(self)
			return " " .. self.status_dict.head
		end,
	},
}

local Copilot = {
	provider = function()
		return "copilot: " .. require("copilot_status").status().status
	end,
}

return {
	LSPActive = LSPActive,
	Git = Git,
	Copilot = Copilot,
}
