local M = {}

M.__index = M

---@class terminal.Term
---@field buf number
---@field cmd? string|string[]

---@class terminal.OpenConfig
---@field parent number

---@param cmd? string
---@return terminal.Term
function M.new(cmd)
	---@type terminal.Term
	local self = setmetatable({}, M)
	self.cmd = cmd or vim.o.shell
	-- create buf
	self.buf = vim.api.nvim_create_buf(false, true)
	-- run cmd
	vim.api.nvim_buf_call(self.buf, function()
		vim.fn.termopen(self.cmd, {
			on_stdout = function(_, data)
				vim.notify(vim.inspect(data))
			end,
		})
	end)
	return self
end

---@param win_id? number
---@param opts? terminal.OpenConfig
function M:open(win_id, opts)
	local win
	if win_id ~= nil then
		win = vim.api.nvim_set_current_win(win_id)
	else
		opts = opts or {}
		local parent = opts.parent or vim.api.nvim_get_current_win()
		vim.api.nvim_win_call(parent, function()
			vim.cmd("rightbelow 12 split")
			win = vim.api.nvim_get_current_win()
		end)
	end
	win = win or 0

	vim.api.nvim_win_set_buf(win, self.buf)
end

function M:toggle()
	local term = M.new()
	term:open()
end

return M
