local utils = require("heirline.utils")
-- setup colors
local function setup_colors()
	return {
		white = utils.get_highlight("Normal").fg,
		black = utils.get_highlight("Normal").bg,
		bright_bg = utils.get_highlight("Folded").bg,
		bright_fg = utils.get_highlight("Folded").fg,
		red = utils.get_highlight("DiagnosticError").fg,
		green = utils.get_highlight("String").fg,
		cyan = utils.get_highlight("Special").fg,
		orange = utils.get_highlight("Constant").fg,
		purple = utils.get_highlight("Statement").fg,
		directory = utils.get_highlight("Directory").fg,
		file = utils.get_highlight("@Property").fg,
		-- gray = utils.get_highlight("NonText").fg,
		-- diag_warn = utils.get_highlight("DiagnosticWarn").fg,
		-- diag_error = utils.get_highlight("DiagnosticError").fg,
		-- diag_hint = utils.get_highlight("DiagnosticHint").fg,
		-- diag_info = utils.get_highlight("DiagnosticInfo").fg,
		-- git_del = utils.get_highlight("diffDeleted").fg,
		-- git_add = utils.get_highlight("diffAdded").fg,
		-- git_change = utils.get_highlight("diffChanged").fg,
	}
end

-- auto reload new colorscheme
local heirline_group = vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		utils.on_colorscheme(setup_colors)
	end,
	group = heirline_group,
})

return setup_colors
