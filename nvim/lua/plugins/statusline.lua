local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then return end

local navic_ok, navic = pcall(require, 'nvim-navic')
if navic_ok then
	vim.notify("There is a problem of missing navic.", vim.log.levels.WARN)
end

lualine.setup {
	sections = {
		lualine_c = {
			{
				function()
					return navic.get_location()
				end,
				cond = function()
					return navic.is_available()
				end
			},
		}
	}
}
