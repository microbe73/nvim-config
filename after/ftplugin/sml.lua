vim.keymap.set('n', '<F10>', function()
  local filename = vim.api.nvim_buf_get_name(0)
  vim.cmd 'vsplit'
  vim.cmd 'terminal'
  vim.fn.feedkeys 'a'
  local enter = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
  vim.fn.feedkeys('clear' .. enter)
  vim.fn.feedkeys('sml ' .. filename .. enter)
end)