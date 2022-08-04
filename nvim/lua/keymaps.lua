vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opts = {noremap = true, silent = true}
local inoremap = function(key, result)
	vim.api.nvim_set_keymap('i', key, result, opts)
end
local nnoremap = function(key, result)
	vim.api.nvim_set_keymap('n', key, result, opts)
end

inoremap('jk', '<ESC>')
nnoremap('<leader>fw', ':write<CR>')
nnoremap('<leader>fq', ':wq<CR>')
