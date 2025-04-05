---@class utils.dashboard
---@overload fun(opts?: utils.dashboard.Opts): utils.dashboard.Class
local M = setmetatable({}, {
	__call = function(M, opts)
		return M.open(opts)
	end,
})

M.sections = {}

---@alias utils.dashboard.Gen fun(utils.dashboard.Class) :utils.dashboard.Item
---@return utils.dashboard.Gen
function M.sections.header()
	---@param self utils.dashboard.Class
	return function(self)
		return { header = self.opts.present.header }
	end
end

---@class utils.dashboard.Text
---@field [1] string
---@field width number
---@field align? "left" | "center" | "right"
---@field hl? string

---@class utils.dashboard.Line
---@field [number] utils.dashboard.Text
---@field width number

---@class utils.dashboard.Block
---@field [number] utils.dashboard.Line
---@field width number

---@class utils.dashboard.Config
---@field sections utils.dashboard.Item[]
---@field pane_gap number
---@field width number
---@field col? number
---@field row? number
---@field formats table<string, utils.dashboard.Text>
local defaults = {
	pane_gap = 4,
	width = 60,
	col = nil,
	row = nil,
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
			pane = 1,
		},
	},
	formats = {
		header = { "%s", align = "center" },
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
---@field section? utils.dashboard.Item
---@field hidden? boolean
---@field [string] any

---@class utils.dashboard.Class
---@field win number
---@field buf number
---@field opts utils.dashboard.Opts
---@field augroup number
---@field panes? utils.dashboard.Item[][]
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
	-- print(vim.inspect(self.items))
	self:layout()
	self:render()
end

function D:layout()
	local max_panes = math.floor((self._size.width + self.opts.pane_gap) / (self.opts.width + self.opts.pane_gap))
	self.panes = {} ----@type utils.dashboard.Item[][]
	for _, item in ipairs(self.items) do
		if not item.hidden then
			local pane = item.pane or 1
			pane = math.fmod(pane - 1, max_panes) + 1
			self.panes[pane] = self.panes[pane] or {}
			table.insert(self.panes[pane], item)
		end
	end
	for i = 1, math.max(unpack(vim.tbl_keys(self.panes))) do
		self.panes[i] = self.panes[i] or {}
	end
end

function D:render()
	self.col = self.opts.col
		or math.floor(self._size.width - (self.opts.width * #self.panes + self.opts.pane_gap * (#self.panes - 1)))
			/ 2

	local lines = {}
	for p, pane in ipairs(self.panes) do
		local indent = (" "):rep(p == 1 and self.col or self.opts.pane_gap)
		local row = 0
		for _, item in ipairs(pane) do
			for _, line in ipairs(self:format(item)) do
				row = row + 1
				if p > 1 and not lines[row] then
					lines[row] = (" "):rep(self.col + (self.opts.pane_gap * self.opts.width) * (p - 1))
				elseif p == 1 and line.width > self.opts.width then
					lines[row] = (" "):rep(self.col - math.floor((line.width - self.opts.width) / 2))
				else
					lines[row] = (lines[row] or "") .. indent
				end
				for t, text in ipairs(line[1]) do
					lines[row] = lines[row] .. text
				end
			end
		end
	end
	-- vertical position
	local above = math.floor((self._size.height - #lines) / 2)
	for _ = 1, above do
		table.insert(lines, 1, "")
	end

	vim.bo[self.buf].modifiable = true
	vim.api.nvim_buf_set_lines(self.buf, 0, -1, false, lines)
	vim.bo[self.buf].modifiable = false
end

---@param item utils.dashboard.Item
---@return utils.dashboard.Block
function D:format(item)
	local lines = {} ---@type utils.dashboard.Text[]
	if item.header then
		-- for _, line in ipairs(vim.split(item.header, "\n")) do
		-- 	local align = self.opts.formats["header"].align
		-- 	table.insert(lines, { self:align(line, self.opts.width, align), width = vim.api.nvim_strwidth(line) })
		-- end
		for _, line in ipairs(self:texts(self:format_field(item, "header"))) do
			table.insert(lines, line)
		end
	end
	local block = self:block(lines)
	-- print(vim.inspect(block))
	return block
end

---@param texts utils.dashboard.Text[]
---@return utils.dashboard.Block
function D:block(texts)
	local ret = { { width = 0 }, width = 0 } ---@type utils.dashboard.Block
	for _, text in ipairs(texts) do
		local lines = text[1]:find("\n") and vim.split(text[1], "\n") or { text[1] }
		for l, line in ipairs(lines) do
			if l > 1 then
				ret[#ret + 1] = { width = 0 }
			end
			local child = setmetatable({ line }, { __index = text })
			-- self:align(child)
			ret[#ret].width = ret[#ret].width + vim.api.nvim_strwidth(line)
			ret.width = math.max(ret.width, ret[#ret].width)
			table.insert(ret[#ret], child)
		end
	end
	return ret
end

---@param item utils.dashboard.Item
---@param field string
---@return utils.dashboard.Text|utils.dashboard.Text[]
function D:format_field(item, field)
	local format = self.opts.formats[field]
	if format == nil then
		return { item[field], hl = field }
	elseif type(format) == "function" then
		return format(item)
	else
		local text = format and vim.deepcopy(format) or { "%s" }
		text.hl = text.hl or field
		text[1] = text[1] == "%s" and item[field] or text[1]:format(item[field])
		return text
	end
end

---@param texts string|utils.dashboard.Text|utils.dashboard.Text[]
---@return utils.dashboard.Text[]
function D:texts(texts)
	texts = type(texts) == "string" and { { texts } } or texts
	texts = type(texts[1]) == "string" and { texts } or texts
	return texts --[[ @as utils.dashboard.Text[] ]]
end

---@param text string
---@param width? number
---@param align? "left" | "center" | "right"
function D:align(text, width, align)
	align = align or "left"
	local len = vim.api.nvim_strwidth(text)
	local before = align == "center" and math.floor((width - len) / 2) or align == "right" and width - len or 0
	local after = align == "center" and width - len - before or align == "left" and width - len or 0
	return (" "):rep(before) .. text .. (" "):rep(after)
end

---@param item utils.dashboard.Item?
---@param results? utils.dashboard.Item[]
---@param parent? utils.dashboard.Item
function D:resolve(item, results, parent)
	-- print("resolving: " .. vim.inspect(item))
	results = results or {}
	if not item then
		return results
	end
	if type(item) == "table" and vim.tbl_isempty(item) then
		return results
	end
	if type(item) == "table" and parent then
		for _, prop in ipairs({ "pane" }) do
			item[prop] = item[prop] or parent[prop]
		end
	end
	if type(item) == "function" then
		return self:resolve(item(self), results, parent)
	elseif type(item) == "table" and self:is_enabled(item) then
		if not item.section and not item[1] then
			table.insert(results, item)
			return results
		end
		if item.section then
			local section = M.sections[item.section]()
			self:resolve(section, results, item)
		end
		if item[1] then
			for _, child in ipairs(item) do
				self:resolve(child, results, item)
			end
		end
	end
	return results
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
