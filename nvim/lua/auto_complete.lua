local function is_ignored_character(char)
  local ignored_characters = { ' ', '\t', '\n' }
  return vim.list_contains(ignored_characters, char)
end

local function is_keyword_character(char)
  return char == '-' or char == '_' or char:match('^[%w]$') ~= nil
end

local function is_lsp_trigger_character(char)
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    local provider = client.server_capabilities.completionProvider
    if provider and provider.triggerCharacters then
      return vim.list_contains(provider.triggerCharacters, char)
    end
  end
  return false
end

local group = vim.api.nvim_create_augroup('auto_complete', { clear = true })
vim.api.nvim_create_autocmd('InsertCharPre', {
  group = group,
  callback = function()
    if vim.bo.omnifunc == '' then return end
    local char = vim.v.char
    if
      not is_ignored_character(char)
      and (is_lsp_trigger_character(char) or is_keyword_character(char))
    then
      local key = vim.keycode('<C-x><C-o>')
      vim.api.nvim_feedkeys(key, 'm', false)
    end
  end,
})
