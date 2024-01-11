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

-- Auto Cd to the project or current dir when opening a single file in command line
vim.api.nvim_create_autocmd("VimEnter", {
	group = usergroup,
	callback = function()
		if vim.fn.argc() == 1 then
			---@type string | string[]
			local path =
				require("lspconfig.util").root_pattern("pubspec.yaml", ".git", ".project")(vim.fn.expand("%:p:h"))
			if path == nil then
				path = vim.fn.expand("%:p:h")
			end
			vim.cmd("cd " .. path)
		end
	end,
})

-- TODO: fix
-- -- Close buf when leave if it's not modified and empty
-- vim.api.nvim_create_autocmd("BufLeave", {
-- 	group = usergroup,
-- 	callback = function()
-- 		if vim.bo.modified == false and vim.bo.buftype == "" and vim.fn.line("$") == 1 then
-- 			vim.cmd("bd")
-- 		end
-- 	end,
-- })
