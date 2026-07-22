---@type vim.lsp.Config
return {
  cmd = { 'stylua', '--lsp' },
  filetypes = { 'lua' },
  root_markers = vim.list_extend(vim.deepcopy(_G.configs.lsp.root_markers), { 'stylua.toml' }),
}
