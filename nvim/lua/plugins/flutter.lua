local flutter_ok, flutter = pcall(require, 'flutter-tools')
if not flutter_ok then
	return
end

local on_attach, capabilities = require 'plugins.lsp.handlers'

local dap_avail, _ = pcall(require, 'dap')

flutter.setup {
	debugger = {
		enabled = true,
		run_via_dap = dap_avail,
		register_configurations = function(paths)
			require("dap").configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Flutter Program",
					program = "./lib/main.dart",
					cwd = "${workspaceFolder}",
					-- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
					toolArgs = { "-d", "51199BE2" }
				}
			}
		end,
	},
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

local telescope_ok, telescope = pcall(require, 'telescope')
if telescope_ok then
	telescope.load_extension("flutter")
end
