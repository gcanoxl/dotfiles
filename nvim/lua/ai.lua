-- Sidekick
vim.pack.add({ 'https://github.com/folke/sidekick.nvim' })

require('sidekick').setup({
  cli = {
    tools = {
      codex_readonly = {
        cmd = { 'codex', '--sandbox', 'read-only', '--ask-for-approval', 'never' },
        is_proc = '\\<codex\\>',
        url = 'https://github.com/openai/codex',
        resume = { 'resume' },
        continue = { 'resume', '--last' },
      },
    },
  },
})
