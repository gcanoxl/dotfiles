---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.project', '.git' },
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      format = {
        enable = false,
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
      },
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
    },
  },
}
