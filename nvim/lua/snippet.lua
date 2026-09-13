local SNIPPET_PATH = vim.fn.stdpath('config') .. '/snippets/'
local M = {}
M.loaded = {}

---@class SnippetEntry
---@field abbr string
---@field body string

---comment
---@param filetypes? string|table<string>
function M.load(filetypes)
  if not filetypes then
    filetypes = {}
    for name, type in vim.fs.dir(SNIPPET_PATH) do
      if type == 'directory' then table.insert(filetypes, name) end
    end
  end
  filetypes = type(filetypes) == 'string' and { filetypes } or filetypes
  ---@cast filetypes table<string>

  for _, ft in ipairs(filetypes) do
    if M.loaded[ft] == nil then
      local ft_path = SNIPPET_PATH .. ft .. '/'
      local stat = vim.uv.fs_stat(ft_path)
      if stat and stat.type == 'directory' then
        local ft_snippets = {}
        for name, type in vim.fs.dir(ft_path) do
          if type == 'file' then
            local body = vim.fn.readblob(ft_path .. name)
            ---@type SnippetEntry
            local entry = { abbr = name, body = body }
            table.insert(ft_snippets, entry)
          end
        end
        M.loaded[ft] = ft_snippets
      end
    end
  end
end

---@param filetype string
---@param only? boolean
function M.get(filetype, only)
  only = only or false
  if not only and M.loaded['all'] == nil then M.load('all') end
  if M.loaded[filetype] == nil then M.load(filetype) end
  local ret = vim.deepcopy(M.loaded[filetype] or {}) -- previous loading may fail
  if not only then vim.list_extend(ret, vim.deepcopy(M.loaded['all'] or {})) end
  return ret
end
return M
