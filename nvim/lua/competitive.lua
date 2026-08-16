-- TODO: Rewrite this config
local M = {}

local receive_directory

vim.pack.add({
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/xeluxee/competitest.nvim',
})

require('competitest').setup({
  popup_ui = {
    layout = {
      { 4, 'tc' },
      { 5, { { 1, 'so' }, { 1, 'si' } } },
      { 5, { { 1, 'eo' }, { 1, 'se' } } },
    },
  },

  compile_command = {
    c = { exec = 'gcc', args = { '-Wall', '$(FNAME)', '-o', 'program' } },
    cpp = { exec = 'g++', args = { '-Wall', '$(FNAME)', '-o', 'program' } },
  },
  run_command = {
    c = { exec = './program' },
    cpp = { exec = './program' },
  },

  testcases_directory = './testcases/',
  testcases_input_file_format = '$(TCNUM).in',
  testcases_output_file_format = '$(TCNUM).out',

  template_file = {
    cpp = vim.fn.stdpath('config') .. '/templates/template.cpp',
  },
  evaluate_template_modifiers = true,

  received_problems_path = function(task, file_extension)
    if not receive_directory or vim.fn.isdirectory(receive_directory) == 0 then
      vim.notify(('Invalid receive directory: %s'):format(receive_directory or 'nil'), vim.log.levels.ERROR)
      return
    end

    local id = task.url:match('^https?://open%.kattis%.com/problems/([^/?#]+)')
    if not id then
      vim.notify('Unsupported problem URL: ' .. task.url, vim.log.levels.WARN)
      return
    end

    return vim.fs.joinpath(receive_directory, id, id .. '.' .. file_extension)
  end,
})

function M.receive_problem()
  local cwd = vim.fn.getcwd()

  Snacks.picker({
    title = 'Receive Problem Directory',
    cwd = cwd,
    finder = function()
      local items = {
        { text = '.', file = cwd },
      }

      for name, item_type in
        vim.fs.dir(cwd, {
          depth = math.huge,
          skip = function(directory) return vim.fs.basename(directory) ~= '.git' end,
        })
      do
        if item_type == 'directory' and vim.fs.basename(name) ~= '.git' then
          items[#items + 1] = {
            text = name,
            file = vim.fs.joinpath(cwd, name),
          }
        end
      end

      return items
    end,
    format = 'file',
    confirm = function(picker, item)
      if not item then return end

      receive_directory = item.file
      picker:close()
      vim.cmd('CompetiTest receive problem')
    end,
  })
end

return M
