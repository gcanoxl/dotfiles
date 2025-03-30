---@class utils.dashboard
---@overload fun(opts?: utils.dashboard.Opts): utils.dashboard.Class
local M = setmetatable({}, {
	__call = function(M, opts)
		return M.open(opts)
	end,
})

---@class utils.dashboard.Opts
---@field buf? number
---@field win? number
---@field sections utils.dashboard.Item[]

local wo = {
	colorcolumn = "",
	cursorcolumn = false,
	cursorline = false,
	foldmethod = "manual",
	list = false,
	number = false,
	relativenumber = false,
	---
	spell = false,
	winbar = "",
	wrap = false,
}

local bo = {
	bufhidden = "wipe",
	buftype = "nofile",
	buflisted = false,
	filetype = "dashboard",
	swapfile = false,
	undofile = false,
}

---@class utils.dashboard.Item
---@field title? string

---@class utils.dashboard.Class
---@field win number
---@field buf number
---@field opts utils.dashboard.Opts
---@field augroup number
local D = {}

function D:init()
	vim.api.nvim_win_set_buf(self.win, self.buf)
	vim.o.ei = "all"
	-- setup wo
	for name, value in pairs(wo) do
		vim.api.nvim_set_option_value(name, value, { scope = "local", win = self.win })
	end
	-- setup bo
	for name, value in pairs(bo) do
		vim.api.nvim_set_option_value(name, value, { scope = "local", buf = self.buf })
	end
	vim.o.ei = ""
	if self:is_float() then
		vim.keymap.set("n", "<esc>", "<cmd>bd<cr>", { silent = true, buffer = self.buf })
	end
	vim.keymap.set("n", "q", "<cmd>bd<cr>", { silent = true, buffer = self.buf })
	vim.api.nvim_create_autocmd({ "WinResized", "VimResized" }, {
		group = self.augroup,
		callback = function()
			-- TODO: implement
		end,
	})
	vim.api.nvim_create_autocmd({ "BufWipeout", "BufDelete" }, {
		group = self.augroup,
		callback = function()
			vim.api.nvim_del_augroup_by_id(self.augroup)
		end,
	})
end

function D:update()
	if not (self.buf and vim.api.nvim_buf_is_valid(self.buf)) then
		return
	end
	self._size = self:size()
	self.items = self:resolve(self.opts.sections)
end

---@param sections? utils.dashboard.Item[]
function D:resolve(sections) end

---@return { width: number, height: number }
function D:size()
	return {
		width = vim.api.nvim_win_get_width(self.win),
		height = vim.api.nvim_win_get_height(self.win),
	}
end

function D:is_float()
	return vim.api.nvim_win_get_config(self.win).relative ~= ""
end

---@type utils.dashboard.Opts
local defaults = {
	sections = {},
}

---Open a new dashboard
---@param opts? utils.dashboard.Opts
---@return utils.dashboard.Class
function M.open(opts)
	local self = setmetatable({}, { __index = D })
	---@type utils.dashboard.Opts
	self.opts = vim.tbl_extend("force", defaults, opts or {})
	self.buf = self.opts.buf or vim.api.nvim_create_buf(false, true)
	self.buf = self.buf == 0 and vim.api.nvim_get_current_buf() or self.buf
	self.win = self.opts.win or 0
	self.win = self.win == 0 and vim.api.nvim_get_current_win() or self.win
	self.augroup = vim.api.nvim_create_augroup("utils_dashboard", { clear = true })
	self:init()
	return self
end

return M
