-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

---@class Keymap
---@field [1] string|string[] mode
---@field [2] string lhs
---@field [3] string|function rhs
---@field opts? vim.keymap.set.Opts
---@field desc string

---@type Keymap[]
local keymaps = {
  -- Basic
  { 'i', 'jk', '<esc>', desc = 'Quit Insert Mode' },
  { 'n', '<leader>aq', '<cmd>wqa<cr>', desc = 'Write Quit All' },
  { 'n', '<leader>ar', '<cmd>restart<cr>', desc = 'Restart Neovim' },
  -- Application
  {
    'n',
    '<leader>ac',
    function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end,
    desc = 'Find Neovim Config Files',
  },
  { 'n', '<leader>an', function() Snacks.picker.notifications() end, desc = 'Notification History' },
  { 'n', '<leader>aC', function() Snacks.picker.colorscheme() end, desc = 'Colorschemes' },

  -- Search
  { 'n', '<leader>ss', function() Snacks.picker.grep() end, desc = 'Grep Files' },
  { 'n', '<leader>sh', function() Snacks.picker.help() end, desc = 'Help Pages' },
  { 'n', '<leader>sH', function() Snacks.picker.highlights() end, desc = 'Highlights' },
  { 'n', '<leader>s"', function() Snacks.picker.registers() end, desc = 'Registers' },
  { 'n', '<leader>s/', function() Snacks.picker.search_history() end, desc = 'Search History' },
  { 'n', '<leader>sa', function() Snacks.picker.autocmds() end, desc = 'Autocommands' },
  { 'n', '<leader>sc', function() Snacks.picker.command_history() end, desc = 'Command History' },
  { 'n', '<leader>s:', function() Snacks.picker.commands() end, desc = 'Commands' },
  { 'n', '<leader>si', function() Snacks.picker.icons() end, desc = 'Icons' },
  { 'n', '<leader>sj', function() Snacks.picker.jumps() end, desc = 'Jump List' },
  { 'n', '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
  { 'n', '<leader>sl', function() Snacks.picker.loclist() end, desc = 'Location List' },
  { 'n', '<leader>sm', function() Snacks.picker.marks() end, desc = 'Marks' },
  { 'n', '<leader>sM', function() Snacks.picker.man() end, desc = 'Man Pages' },
  { 'n', '<leader>sq', function() Snacks.picker.qflist() end, desc = 'Quickfix List' },
  { 'n', '<leader>sR', function() Snacks.picker.resume() end, desc = 'Resume Last Picker' },
  { 'n', '<leader>su', function() Snacks.picker.undo() end, desc = 'Undo History' },

  -- Buffer
  { 'n', '<leader>bb', function() Snacks.picker.buffers() end, desc = 'Find Buffers' },
  { 'n', '<C-b>', function() Snacks.picker.buffers() end, desc = 'Find Buffers' },

  -- Window Navigation
  { 'n', '<C-h>', '<C-w>h', desc = 'Go To Left Window' },
  { 'n', '<C-j>', '<C-w>j', desc = 'Go To Lower Window' },
  { 'n', '<C-k>', '<C-w>k', desc = 'Go To Upper Window' },
  { 'n', '<C-l>', '<C-w>l', desc = 'Go To Right Window' },
  -- Files
  { 'n', '<leader>fw', '<cmd>wa<cr>', desc = 'Write All Files' },
  { 'n', '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
  { 'n', '<C-f>', function() Snacks.picker.files() end, desc = 'Find Files' },
  { 'n', '<leader>fl', function() Snacks.explorer() end, desc = 'File Explorer' },
  { 'n', '<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent Files' },
  -- Git
  { 'n', '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
  { 'n', '<leader>gf', function() Snacks.picker.git_files() end, desc = 'Find Git Files' },
  { 'n', '<leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git Branches' },
  { 'n', '<leader>gll', function() Snacks.picker.git_log() end, desc = 'Git Log' },
  { 'n', '<leader>glL', function() Snacks.picker.git_log_line() end, desc = 'Git Log Line' },
  { 'n', '<leader>glf', function() Snacks.picker.git_log_file() end, desc = 'Git Log File' },
  { 'n', '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status' },
  { 'n', '<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git Stashes' },
  { 'n', '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff' },
  -- Project
  { 'n', '<leader>pp', function() Snacks.picker.projects() end, desc = 'Projects' },
  -- LSP
  { 'n', 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Go To Definition' },
  { 'n', 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Go To Declaration' },
  { 'n', 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'Find References' },
  { 'n', 'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Go To Implementation' },
  { 'n', 'gy', function() Snacks.picker.lsp_type_definitions() end, desc = 'Go To Type Definition' },
  { 'n', 'gai', function() Snacks.picker.lsp_incoming_calls() end, desc = 'Incoming Calls' },
  { 'n', 'gao', function() Snacks.picker.lsp_outgoing_calls() end, desc = 'Outgoing Calls' },
  { 'n', 'gC', function() Snacks.picker.lsp_config() end, desc = 'LSP Config' },
  { 'n', 'gl', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
  { 'n', 'gL', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },
}

for _, keymap in ipairs(keymaps) do
  vim.keymap.set(keymap[1], keymap[2], keymap[3], {

    desc = keymap.desc,

    unpack(keymap.opts or {}),
  })
end
