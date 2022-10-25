local status_ok, tabby = pcall(require, 'tabby.tabline')
if not status_ok then return end

tabby.set(function()
	return {}
end)
