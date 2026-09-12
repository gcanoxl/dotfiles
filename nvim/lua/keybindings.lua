-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local icons = {
  application = { cat = 'filetype', name = 'vim', color = 'green' },
  search = { icon = '', color = 'green' },
  buffers = { icon = '󰈔', color = 'cyan' },
  files = { icon = '', color = 'blue' },
  git = { cat = 'filetype', name = 'git', color = 'orange' },
  git_log = { icon = '󰋚', color = 'yellow' },
  ai = { icon = '󰚩', color = 'purple' },
  projects = { icon = '󰏗', color = 'purple' },
}

local keymaps = {
  -- Basic
  { 'jk', '<esc>', desc = 'Quit Insert Mode', mode = 'i' },
  -- Application
  { '<leader>a', group = 'Application', icon = icons.application },
  { '<leader>aq', '<cmd>wqa<cr>', desc = 'Write Quit All' },
  { '<leader>ar', '<cmd>restart<cr>', desc = 'Restart Neovim' },
  {
    '<leader>ac',
    function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end,
    desc = 'Find Neovim Config Files',
  },
  {
    '<leader>an',
    function() Snacks.picker.notifications() end,
    desc = 'Notification History',
  },
  {
    '<leader>aC',
    function() Snacks.picker.colorschemes() end,
    desc = 'Colorschemes',
  },

  -- Search
  { '<leader>s', group = 'Search', icon = icons.search },
  { '<leader>ss', function() Snacks.picker.grep() end, desc = 'Grep Files' },
  { '<leader>sh', function() Snacks.picker.help() end, desc = 'Help Pages' },
  {
    '<leader>sH',
    function() Snacks.picker.highlights() end,
    desc = 'Highlights',
  },
  {
    '<leader>s"',
    function() Snacks.picker.registers() end,
    desc = 'Registers',
  },
  {
    '<leader>s/',
    function() Snacks.picker.search_history() end,
    desc = 'Search History',
  },
  {
    '<leader>sa',
    function() Snacks.picker.autocmds() end,
    desc = 'Autocommands',
  },
  {
    '<leader>sc',
    function() Snacks.picker.command_history() end,
    desc = 'Command History',
  },
  { '<leader>s:', function() Snacks.picker.commands() end, desc = 'Commands' },
  { '<leader>si', function() Snacks.picker.icons() end, desc = 'Icons' },
  { '<leader>sj', function() Snacks.picker.jumps() end, desc = 'Jump List' },
  { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
  {
    '<leader>sl',
    function() Snacks.picker.loclist() end,
    desc = 'Location List',
  },
  { '<leader>sm', function() Snacks.picker.marks() end, desc = 'Marks' },
  { '<leader>sM', function() Snacks.picker.man() end, desc = 'Man Pages' },
  {
    '<leader>sq',
    function() Snacks.picker.qflist() end,
    desc = 'Quickfix List',
  },
  {
    '<leader>sR',
    function() Snacks.picker.resume() end,
    desc = 'Resume Last Picker',
  },
  { '<leader>su', function() Snacks.picker.undo() end, desc = 'Undo History' },

  -- Buffer
  { '<leader>b', group = 'Buffers', icon = icons.buffers },
  {
    '<leader>bb',
    function() Snacks.picker.buffers() end,
    desc = 'Find Buffers',
  },
  { '<C-b>', function() Snacks.picker.buffers() end, desc = 'Find Buffers' },

  -- Window Navigation
  { '<C-h>', '<C-w>h', desc = 'Go To Left Window' },
  { '<C-j>', '<C-w>j', desc = 'Go To Lower Window' },
  { '<C-k>', '<C-w>k', desc = 'Go To Upper Window' },
  { '<C-l>', '<C-w>l', desc = 'Go To Right Window' },
  -- Files
  { '<leader>f', group = 'Files', icon = icons.files },
  { '<leader>fw', '<cmd>wa<cr>', desc = 'Write All Files' },
  { '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
  { '<C-f>', function() Snacks.picker.files() end, desc = 'Find Files' },
  { '<leader>fl', function() Snacks.explorer() end, desc = 'File Explorer' },
  {
    '<leader>fr',
    function() Snacks.picker.recent() end,
    desc = 'Recent Files',
  },
  -- Git
  { '<leader>g', group = 'Git', icon = icons.git },
  { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
  {
    '<leader>gf',
    function() Snacks.picker.git_files() end,
    desc = 'Find Git Files',
  },
  {
    '<leader>gb',
    function() Snacks.picker.git_branches() end,
    desc = 'Git Branches',
  },
  {
    '<leader>gs',
    function() require('gitsigns').stage_hunk() end,
    desc = 'Stage Hunk',
  },
  {
    '<leader>gr',
    function() require('gitsigns').reset_hunk() end,
    desc = 'Reset Hunk',
  },
  {
    '<leader>gs',
    function()
      require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end,
    desc = 'Stage Hunk',
    mode = 'v',
  },
  {
    '<leader>gr',
    function()
      require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end,
    desc = 'Reset Hunk',
    mode = 'v',
  },
  { '<leader>gl', group = 'Git Log', icon = icons.git_log },
  { '<leader>gll', function() Snacks.picker.git_log() end, desc = 'Git Log' },
  {
    '<leader>glL',
    function() Snacks.picker.git_log_line() end,
    desc = 'Git Log Line',
  },
  {
    '<leader>glf',
    function() Snacks.picker.git_log_file() end,
    desc = 'Git Log File',
  },
  {
    '<leader>gS',
    function() Snacks.picker.git_status() end,
    desc = 'Git Status',
  },
  {
    '<leader>gH',
    function() Snacks.picker.git_stash() end,
    desc = 'Git Stashes',
  },
  { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff' },
  -- AI
  { '<leader>i', group = 'AI', icon = icons.ai },
  {
    '<leader>ic',
    function()
      require('sidekick.cli').toggle({ name = 'codex_readonly', focus = true })
    end,
    desc = 'Codex Readonly',
  },
  {
    '<leader>iC',
    function() require('sidekick.cli').toggle({ name = 'codex', focus = true }) end,
    desc = 'Codex',
  },
  -- Competitive Programming
  { '<leader>I', group = 'Competitive' },
  {
    '<leader>Ic',
    function() require('competitive').receive_problem() end,
    desc = 'Receive Problem',
  },
  { '<leader>Ir', '<cmd>CompetiTest run<cr>', desc = 'Run' },
  { '<leader>Ia', '<cmd>CompetiTest add_testcase<cr>', desc = 'Add Testcase' },
  {
    '<leader>Ie',
    '<cmd>CompetiTest edit_testcase<cr>',
    desc = 'Edit Testcase',
  },
  {
    '<leader>Id',
    '<cmd>CompetiTest delete_testcase<cr>',
    desc = 'Delete Testcase',
  },
  -- Project
  { '<leader>p', group = 'Projects', icon = icons.projects },
  { '<leader>pp', function() Snacks.picker.projects() end, desc = 'Projects' },
  -- LSP
  {
    'gd',
    function() Snacks.picker.lsp_definitions() end,
    desc = 'Go To Definition',
  },
  {
    'gD',
    function() Snacks.picker.lsp_declarations() end,
    desc = 'Go To Declaration',
  },
  { 'gra', vim.lsp.buf.code_action, desc = 'Code Action', mode = { 'n', 'x' } },
  { 'gri', vim.lsp.buf.implementation, desc = 'Go To Implementation' },
  { 'grn', vim.lsp.buf.rename, desc = 'Rename' },
  { 'grr', vim.lsp.buf.references, desc = 'Find References' },
  { 'grt', vim.lsp.buf.type_definition, desc = 'Go To Type Definition' },
  { 'grx', vim.lsp.codelens.run, desc = 'Run Code Lens' },
  {
    'gai',
    function() Snacks.picker.lsp_incoming_calls() end,
    desc = 'Incoming Calls',
  },
  {
    'gao',
    function() Snacks.picker.lsp_outgoing_calls() end,
    desc = 'Outgoing Calls',
  },
  { 'gC', function() Snacks.picker.lsp_config() end, desc = 'LSP Config' },
  { 'gl', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
  {
    'gL',
    function() Snacks.picker.lsp_workspace_symbols() end,
    desc = 'LSP Workspace Symbols',
  },
}

local wk = require('which-key')
wk.add(keymaps)

local local_keymaps_group =
  vim.api.nvim_create_augroup('LocalKeymaps', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = local_keymaps_group,
  pattern = 'dart',
  callback = function(event)
    vim.keymap.set('n', '<localleader>e', '<cmd>FlutterEmulators<cr>', {
      buffer = event.buf,
      desc = 'Flutter Emulators',
    })
    vim.keymap.set('n', '<localleader>w', '<cmd>FlutterOutlineToggle<cr>', {
      buffer = event.buf,
      desc = 'Flutter Widget Outline',
    })
    vim.keymap.set('n', '<localleader>r', '<cmd>FlutterRun<cr>', {
      buffer = event.buf,
      desc = 'Flutter Run',
    })
    vim.keymap.set('n', '<localleader>R', '<cmd>FlutterRestart<cr>', {
      buffer = event.buf,
      desc = 'Flutter Restart',
    })
  end,
})
