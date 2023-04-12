local ufo_ok, ufo = pcall(require, 'ufo')
if not ufo_ok then return end



ufo.setup({
	provider_selector = function(_, _, _)
		return { 'treesitter', 'indent' }
	end
});
