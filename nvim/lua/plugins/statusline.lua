local function setup_colors()
	local utils = require("heirline.utils")
	return {
		white = utils.get_highlight("Normal").fg,
		bright_bg = utils.get_highlight("Folded").bg,
		bright_fg = utils.get_highlight("Folded").fg,
		red = utils.get_highlight("DiagnosticError").fg,
		dark_red = utils.get_highlight("DiffDelete").bg,
		green = utils.get_highlight("String").fg,
		blue = utils.get_highlight("Function").fg,
		gray = utils.get_highlight("NonText").fg,
		orange = utils.get_highlight("Constant").fg,
		purple = utils.get_highlight("Statement").fg,
		cyan = utils.get_highlight("Special").fg,
		diag_warn = utils.get_highlight("DiagnosticWarn").fg,
		diag_error = utils.get_highlight("DiagnosticError").fg,
		diag_hint = utils.get_highlight("DiagnosticHint").fg,
		diag_info = utils.get_highlight("DiagnosticInfo").fg,
		git_del = utils.get_highlight("diffDeleted").fg,
		git_add = utils.get_highlight("diffAdded").fg,
		git_change = utils.get_highlight("diffChanged").fg,
	}
end

local ViMode = {
	init = function(self)
		self.mode = vim.fn.mode()
	end,
	static = {
		mode_colors = {
			n = "red",
			i = "green",
			v = "cyan",
			V = "cyan",
			["\22"] = "cyan",
			c = "orange",
			s = "purple",
			S = "purple",
			["\19"] = "purple",
			R = "orange",
			r = "orange",
			["!"] = "red",
			t = "red",
		},
	},
	provider = function(self)
		return " " .. self.mode:upper() .. " "
	end,
	hl = function(self)
		return {
			fg = self.mode_colors[self.mode],
			bg = "bright_bg",
			bold = true,
		}
	end,
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
}

return {
	"rebelot/heirline.nvim",
	event = "UiEnter",
	config = function()
		-- auto reload new colorscheme
		local heirline_group = vim.api.nvim_create_augroup("Heirline", { clear = true })
		local utils = require("heirline.utils")
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				utils.on_colorscheme(setup_colors)
			end,
			group = heirline_group,
		})

		-- setup heirline
		require("heirline").setup({
			opts = {
				colors = setup_colors(),
			},
			statusline = {
				ViMode,
			},
		})
	end,
}
