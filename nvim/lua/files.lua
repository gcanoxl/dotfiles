local use = require'plugins'

use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

require("nvim-tree").setup()

-- keymaps
local nomap = require'keymaps'
nomap.lnc('fl', ':NvimTreeFocus')
