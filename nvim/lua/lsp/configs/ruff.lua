---@type vim.lsp.Config
return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = vim.list_extend(vim.deepcopy(_G.configs.lsp.root_markers), { 'pyproject.toml', 'ruff.toml' }),
  settings = {},
}
