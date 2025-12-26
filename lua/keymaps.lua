-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.cmd 'tnoremap <Esc> <C-\\><C-n>'

vim.keymap.set('i', '<C-d>', '<Right>')
vim.keymap.set('i', '<C-s>', '<Down>')
vim.keymap.set('i', '<C-a>', '<Left>')
vim.keymap.set('i', '<C-w>', '<Up>')
vim.keymap.set('n', '\\(', 'Bi(<Esc>Wa)<Esc>')
vim.keymap.set('n', '\\\'', 'Bi\'<Esc>Wa\'<Esc>')
vim.keymap.set('n', '\\"', 'Bi"<Esc>Wa"<Esc>')
vim.keymap.set('n', '\\[', 'Bi[<Esc>Wa]<Esc>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>qo', '<cmd>cope<CR>', { desc = '[O]pen [Q]uickfix list' })
vim.keymap.set('n', '<leader>qc', '<cmd>cclose<CR>', { desc = '[C]lose [Q]uickfix list' })
vim.keymap.set('n', '<leader>qd', vim.diagnostic.setqflist, { desc = 'Show diagnostics in quickfix list ' })

vim.keymap.set('n', ']h', '<cmd>Gitsigns nav_hunk next<CR>', { desc = 'Next git hunk' })
vim.keymap.set('n', '[h', '<cmd>Gitsigns nav_hunk prev<CR>', { desc = 'Next git hunk' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


vim.keymap.set('n', '<leader>Ll', function()
  vim.cmd 'edit ~/.config/nvim/lua/options.lua'
  vim.cmd '%s/set background=dark/set background=light'
  vim.cmd 'set background=light'
  vim.cmd 'w'
  vim.cmd 'bdelete'
end, { desc = 'turn light mode on' })
vim.keymap.set('n', '<leader>Ld', function()
  vim.cmd 'edit ~/.config/nvim/lua/options.lua'
  vim.cmd '%s/set background=light/set background=dark'
  vim.cmd 'set background=dark'
  vim.cmd 'w'
  vim.cmd 'bdelete'
end, { desc = 'turn dark mode on' })
-- vim: ts=2 sts=2 sw=2 et
