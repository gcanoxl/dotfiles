_G.utils = {}

function utils.cmd(cmd)
	return "<cmd>" .. cmd .. "<cr>"
end

function utils.map_on_filetype(filetype, maps)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		group = vim.api.nvim_create_augroup("mapping" .. filetype, { clear = true }),
		callback = function()
			local buf = vim.api.nvim_get_current_buf()
			require("which-key").register(maps, { prefix = "<localleader>", buffer = buf })
		end,
	})
end

function utils.buf_move_to_new_tab()
	local win_id = vim.fn.win_getid()
	vim.cmd("tabnew")
	vim.fn.win_execute(win_id, "wincmd c")
end

function utils.code()
	vim.lsp.buf.code_action({
		apply = true,
		filter = function(action)
			return action.title == "Fix All"
		end,
	})
end

function utils.config_files()
	local ok, telescope = pcall(require, "telescope.builtin")
	if not ok then
		vim.notify("Telescope not found", vim.log.levels.ERROR)
		return
	end
	telescope.find_files({
		prompt_title = "Config Files",
		cwd = "~/.config/nvim/",
	})
end

utils.toggles = require("utils.toggles")
utils.bufdelete = require("utils.bufdelete")
