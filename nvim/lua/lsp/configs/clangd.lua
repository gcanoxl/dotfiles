---@type vim.lsp.Config
return {
  cmd = { 'clangd' },
  filetypes = { 'c', 'c.doxygen', 'cpp', 'cpp.doxygen', 'objc', 'objcpp', 'cuda' },

  root_markers = vim.list_extend(vim.deepcopy(_G.configs.lsp.root_markers), { '.clang-format' }),
}
