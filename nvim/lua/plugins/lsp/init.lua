local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then return end

require 'lspconfig'.pyright.setup {}

-- enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { 'sumneko_lua', 'vimls' }
--
-- local capabilities = require 'plugins.lsp.handlers'
--
-- for _, lsp in ipairs(servers) do
-- 	lspconfig[lsp].setup {
-- 		capabilities = capabilities,
-- 	}
-- end
--
-- -- auto format on save
-- vim.cmd [[
-- augroup formatOnSave
--     autocmd!
--     autocmd BufWritePre *.lua :lua vim.lsp.buf.formatting_sync()
-- augroup END
-- ]]
--
-- -- lua remove annoying warnings
-- lspconfig.sumneko_lua.setup {
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { 'vim' }
-- 			}
-- 		}
-- 	}
-- }
