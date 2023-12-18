_G.geem = {}

geem.map_table = { n = {}, i = {}, v = {}, s = {} }

function geem.cmd(cmd)
	return "<cmd>" .. cmd .. "<cr>"
end

function geem.map_on_filetype(filetype, maps)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		group = vim.api.nvim_create_augroup("mapping" .. filetype, { clear = true }),
		callback = function()
			local buf = vim.api.nvim_get_current_buf()
			require("which-key").register(maps, { prefix = "<localleader>", buffer = buf })
		end,
	})
end

function geem.buf_move_to_new_tab()
	local win_id = vim.fn.win_getid()
	vim.cmd("tabnew")
	vim.fn.win_execute(win_id, "wincmd c")
end

geem.code = function()
	vim.lsp.buf.code_action({
		apply = true,
		filter = function(action)
			return action.title == "Fix All"
		end,
	})
end
vim.keymap.set("n", "cc", geem.code)
