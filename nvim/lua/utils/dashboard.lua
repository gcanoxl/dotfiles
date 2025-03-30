---@class utils.dashboard
---@overload fun(opts?: utils.dashboard.Opts): utils.dashboard.Class
local M = setmetatable({}, {
	__call = function(M, opts)
		return M.open(opts)
	end,
})

---@class utils.dashboard.Config
---@field sections utils.dashboard.Item[]
local defaults = {
	present = {
		header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	},
	sections = {
		{
			section = "header",
		},
	},
}

---@class utils.dashboard.Opts: utils.dashboard.Config
---@field buf? number
---@field win? number

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
---@field enabled? boolean|fun(opts:utils.dashboard.Opts):boolean if false, the section will be disabled
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

---@param item utils.dashboard.Item?
---@param results? utils.dashboard.Item[]
---@param parent? utils.dashboard.Item
function D:resolve(item, results, parent)
	print(vim.inspect(item))
	results = results or {}
	if not item then
		return results
	end
	if type(item) == "table" and vim.tbl_isempty(item) then
		return results
	end
	if type(item) == "table" and self:is_enabled(item) then
	end
	-- TODO: implement
end

---@param item utils.dashboard.Item
function D:is_enabled(item)
	local e = item.enabled
	if type(e) == "function" then
		return e(self.opts)
	end
	return e == nil or e
end

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
	self:update()
	return self
end

return M
