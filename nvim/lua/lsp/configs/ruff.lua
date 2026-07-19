---@type vim.lsp.Config
return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { '.project', 'pyproject.toml', 'ruff.toml', '.git' },
  settings = {},
}
