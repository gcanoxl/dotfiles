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
    if
      provider
      and provider.triggerCharacters
      and vim.list_contains(provider.triggerCharacters, char)
    then
      return true
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
      if vim.fn.pumvisible() == 0 then
        local key = vim.keycode('<C-n>')
        vim.api.nvim_feedkeys(key, 'n', false)
      end
    end
  end,
})

-- Snippets
function CompleteSnippets(findstart, _)
  if findstart == 1 then
    return -1
  elseif findstart == 0 then
    local words = {}
    local snippets = require('snippet').get(vim.bo.filetype)
    for _, snippet in ipairs(snippets) do
      table.insert(words, {
        word = snippet['abbr'] or '',
        info = snippet['body'] or '',
        user_data = { is_custom_snippet = true },
        kind = 'Snippet',
      })
    end
    return { words = words }
  end
end

vim.api.nvim_create_autocmd('CompleteDone', {
  group = group,
  callback = function()
    if vim.v.event.reason ~= 'accept' then return end
    local item = vim.v.completed_item
    if
      item == nil
      or item.user_data == nil
      or item.user_data.is_custom_snippet ~= true
    then
      return
    end
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local start_col = col - #item.word
    vim.api.nvim_buf_set_text(0, row - 1, start_col, row - 1, col, {})
    vim.snippet.expand(item.info)
  end,
})

vim.opt.complete = { 'o', 'Fv:lua.CompleteSnippets' }
