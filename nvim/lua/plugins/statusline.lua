local function config()
	local utils = require("heirline.utils")
	local conditions = require("heirline.conditions")
	-- setup colors
	local function setup_colors()
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

	-- auto reload new colorscheme
	local heirline_group = vim.api.nvim_create_augroup("Heirline", { clear = true })
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			utils.on_colorscheme(setup_colors)
		end,
		group = heirline_group,
	})

	-- Mode Section
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

	-- WorkDir
	local WorkDir = {
		init = function(self)
			-- self.icon = (vim.fn.haslocaldir(0) == 1 and "l" or "") .. " "
			local cwd = vim.fn.getcwd(0)
			self.cwd = vim.fn.fnamemodify(cwd, ":~")
		end,
		hl = { fg = utils.get_highlight("Directory").fg, bold = true },
		flexible = 1,
		{
			-- evaluates to the full-lenth path
			provider = function(self)
				local trail = self.cwd:sub(-1) == "/" and "" or "/"
				-- return self.icon .. self.cwd .. trail
				return self.cwd .. trail
			end,
		},
		{
			-- evaluates to the shortened path
			provider = function(self)
				local cwd = vim.fn.pathshorten(self.cwd)
				local trail = self.cwd:sub(-1) == "/" and "" or "/"
				return cwd .. trail .. " "
			end,
		},
		{
			-- evaluates to "", hiding the component
			provider = "",
		},
	}

	-- File Section
	local FileNameBlock = {
		init = function(self)
			self.filename = vim.api.nvim_buf_get_name(0)
		end,
	}
	local FileIcon = {
		init = function(self)
			local filename = vim.api.nvim_buf_get_name(0)
			local extension = vim.fn.fnamemodify(filename, ":e")
			self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension)
		end,
		provider = function(self)
			return self.icon and self.icon .. " "
		end,
		hl = function(self)
			return { fg = self.icon_color }
		end,
	}
	local FileName = {
		provider = function(self)
			local filename = vim.fn.fnamemodify(self.filename, ":.")
			if filename == "" then
				return "[No Name]"
			end
			return filename
		end,
		hl = function(_)
			return { fg = "cyan" }
		end,
	}

	local FileFlags = {
		{
			condition = function()
				return vim.bo.modified
			end,
			provider = function()
				return "[+]"
			end,
			hl = { fg = "green" },
		},
		{
			condition = function()
				return not vim.bo.modifiable or vim.bo.readonly
			end,
			provider = "",
			hl = { fg = "orange" },
		},
	}

	FileNameBlock = utils.insert(FileNameBlock, FileName, FileFlags, { provider = "%<" })

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
			---@diagnostic disable-next-line: undefined-field
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
	local Align = {
		provider = function()
			return "%="
		end,
	}
	local Space = {
		provider = function()
			return " "
		end,
	}

	local DefaultStatusLine = {
		{
			ViMode,
			Space,
			FileIcon,
			WorkDir,
			FileNameBlock,
		},
		Align,
		{
			LSPActive,
			Space,
			Git,
			Space,
		},
	}

	-- setup heirline
	require("heirline").setup({
		opts = {
			colors = setup_colors(),
		},
		statusline = DefaultStatusLine,
	})
end

return {
	{
		"jonahgoldwastaken/copilot-status.nvim",
		dependencies = { "zbirenbaum/copilot.lua" },
		lazy = true,
		event = "BufReadPost",
	},
	{
		"rebelot/heirline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "UiEnter",
		config = config,
	},
}
