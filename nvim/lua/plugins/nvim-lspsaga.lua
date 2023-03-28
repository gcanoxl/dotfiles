local lspsaga_ok, lspsaga = pcall(require, 'lspsaga')
if not lspsaga_ok then
	return
end

lspsaga.setup({
	request_timeout = 8000,
})
