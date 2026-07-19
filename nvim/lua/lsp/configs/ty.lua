---@type vim.lsp.Config
return {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { '.project', 'ty.toml', 'pyproject.toml', '.git' },
}
