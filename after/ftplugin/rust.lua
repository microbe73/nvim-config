vim.cmd 'set makeprg=cargo'
vim.keymap.set('n', '<leader>cr', function()
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 15)
  vim.api.nvim_input 'acargo run\r'
end, { desc = 'Execute program' })
