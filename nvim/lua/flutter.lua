vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-flutter/flutter-tools.nvim',
})

require('flutter-tools').setup({
  root_patterns = vim.list_extend(vim.deepcopy(_G.configs.lsp.root_markers), { 'pubspec.yaml' }),
  widget_guides = {
    enabled = true,
  },
  dev_log = {
    enabled = false,
  },
  lsp = {
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      enableSnippets = true,
      renameFilesWithClasses = 'prompt',
      updateImportsOnRename = true,
    },
  },
})
