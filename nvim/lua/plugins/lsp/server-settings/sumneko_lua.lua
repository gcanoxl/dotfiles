return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim', 'hs' }
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					["/Applications/Hammerspoon.app/Contents/Resources/extensions"] = true
				},
			},
		}
	}
}
