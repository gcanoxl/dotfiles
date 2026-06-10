vim.pack.add({ 'https://github.com/folke/lazydev.nvim' })
require('lazydev').setup({
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
})

---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.project', '.git' },
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
