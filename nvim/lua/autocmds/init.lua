local usergroup = vim.api.nvim_create_augroup("usergroup", { clear = true })

-- auto perform `Fix All` code action on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.dart",
	group = usergroup,
	callback = function()
		vim.lsp.buf.code_action({
			apply = true,
			filter = function(action)
				return action.title == "Fix All"
			end,
		})
	end,
})

-- auto cd to the project or current dir
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	group = usergroup,
	callback = function(buf)
		local listed = vim.bo[buf.buf].buflisted
		if not listed then
			return
		end
		local lsp_util = require("lspconfig.util")
		local root_dir = lsp_util.root_pattern(".project", "pubspec.yaml", ".git", "README.md")(vim.fn.expand("%:p:h"))
		if root_dir ~= nil then
			vim.cmd("cd " .. root_dir)
		else
			vim.cmd("cd " .. vim.fn.expand("%:p:h"))
		end
	end,
})

require("autocmds.viewsaver")
