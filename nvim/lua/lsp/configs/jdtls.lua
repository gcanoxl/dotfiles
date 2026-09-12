---@type vim.lsp.Config
return {
  cmd = { 'jdtls' },
  filetypes = { 'java' },
  root_markers = vim.deepcopy(_G.configs.lsp.root_markers),
}
