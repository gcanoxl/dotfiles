local M = {}
function M.cmd(cmd)
	return "<cmd>" .. cmd .. "<cr>"
end

function M.map_on_filetype(filetype, maps)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		group = vim.api.nvim_create_augroup("mapping" .. filetype, { clear = true }),
		callback = function()
			local buf = vim.api.nvim_get_current_buf()
			require("which-key").register(maps, { prefix = "<localleader>", buffer = buf })
		end,
	})
end

function M.code()
	vim.lsp.buf.code_action({
		apply = true,
		filter = function(action)
			return action.title == "Fix All"
		end,
	})
end

function M.config_files()
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

return M
