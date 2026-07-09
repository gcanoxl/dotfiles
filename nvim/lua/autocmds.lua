local group = vim.api.nvim_create_augroup('configs.autocmds', { clear = true })

vim.api.nvim_create_autocmd('BufReadPost', {
  group = group,
  callback = function()
    -- silently cd to that dir
    -- TODO: seperate this variable and add a configs.lua
    local dir = vim.fs.root(0, { '.project', '.git' })
    if dir == nil then return end
    vim.cmd.lcd(vim.fn.fnameescape(dir))
  end,
})
