local status_ok, feline = pcall(require, 'feline')
if not status_ok then return end

-- TODO: fix logic
local ctp_feline = require('catppuccin.groups.integrations.feline')

feline.setup({
	disable = { filetypes = { "^neo%-tree$" } },
	components = ctp_feline.get(),
})
