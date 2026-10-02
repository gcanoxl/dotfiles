---@type vim.lsp.Config
return {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = vim.list_extend(vim.deepcopy(_G.configs.lsp.root_markers), { 'pyproject.toml', 'ty.toml' }),
}
