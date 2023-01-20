local flutter_ok, flutter = pcall(require, 'flutter-tools')
if not flutter_ok then
	return
end

local on_attach, capabilities = require 'plugins.lsp.handlers'

flutter.setup {
	decorations = {
		statusline = {
			app_version = false,
			device = true,
		}
	},
	widget_guides = {
		enabled = true,
	},
	dev_log = {
		enabled = false,
	},
	lsp = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
}
