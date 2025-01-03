vim.keymap.set('n', '<F10>', function()
  local filename = vim.api.nvim_buf_get_name(0)
  vim.cmd 'vsplit'
  vim.cmd 'terminal'
  vim.fn.feedkeys 'a'
  local enter = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
  vim.fn.feedkeys('clear' .. enter)
  vim.fn.feedkeys('sml ' .. filename .. enter)
end)
vim.diagnostic.config {
  underline = false,
  signs = { severity = { min = vim.diagnostic.severity.E } },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
}
vim.keymap.set('n', '<leader>qo', function()
  vim.diagnostic.setqflist { severity = { min = vim.diagnostic.severity.E } }
end, { desc = 'Open qf list' })
