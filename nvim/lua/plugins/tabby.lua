local status_ok, tabby = pcall(require, 'tabby.tabline')
if not status_ok then return end

-- always display tabline
vim.o.showtabline = 2

tabby.use_preset('tab_with_top_win', {})
