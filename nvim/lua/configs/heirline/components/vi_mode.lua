ViMode = {
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
return ViMode
