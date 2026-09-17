---@type vim.lsp.Config
return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml' },
  root_markers = vim.deepcopy(_G.configs.lsp.root_markers),
  ---@type lspconfig.settings.yamlls
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = { format = { enable = true } },
  },
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = true
  end,
}
