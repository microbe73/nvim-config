-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.cmd 'inoremap {      {}<Left>'
vim.cmd 'inoremap {{     {'
vim.cmd 'inoremap "      ""<Left>'
vim.cmd 'inoremap {}     {}'
vim.cmd 'inoremap ""     ""'
vim.cmd 'inoremap (      ()<Left>'
vim.cmd 'inoremap ((     ('
vim.cmd 'inoremap ()     ()'
vim.cmd 'inoremap [      []<Left>'
vim.cmd 'inoremap [[     ['
vim.cmd 'inoremap []     []'
vim.cmd 'tnoremap <Esc> <C-\\><C-n>'
vim.keymap.set('i', '<C-f>', '<Esc>f$a')
vim.keymap.set('i', '<C-d>', '<Esc>')
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set({ 'i', 'n' }, '<C-s>', '<Esc>:')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>qo', '<cmd>copen<CR>', { desc = 'Open[Q]uickfix list' })
vim.keymap.set('n', '<leader>qd', vim.diagnostic.setqflist, { desc = 'Show diagnostics in quickfix list ' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = 'next qf list item' })
vim.keymap.set('n', '[q', '<cmd>cprev<CR>', { desc = 'prev qf list item' })
vim.keymap.set('n', '<leader>st', function()
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 15)
end, { desc = 'start terminal' })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'qf' }, -- here you can add additional filetypes
  callback = function(ev)
    -- actual mapping
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-n>', '<cmd>cnfile<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-p>', '<cmd>cpfile<CR>', { noremap = true, silent = true })
  end,
  group = vim.api.nvim_create_augroup('qf-maps', { clear = true }),
})

vim.keymap.set('n', '<leader>Lv', '<cmd>loadview<cr>', { desc = 'load saved view, useful for folds' })

vim.keymap.set('n', '<leader>Ll', function()
  vim.cmd 'edit ~/.config/kitty/kitty.conf'
  vim.cmd '%s/2d353b/fdf6e3'
  vim.cmd '%s/d3c6aa/5c6a72'
  vim.cmd 'edit ~/.config/nvim/lua/options.lua'
  vim.cmd '%s/set background=dark/set background=light'
  vim.cmd 'wqa'
end, { desc = 'turn light mode on' })
vim.keymap.set('n', '<leader>Ld', function()
  vim.cmd 'edit ~/.config/kitty/kitty.conf'
  vim.cmd '%s/fdf6e3/2d353b'
  vim.cmd '%s/5c6a72/d3c6aa'
  vim.cmd 'edit ~/.config/nvim/lua/options.lua'
  vim.cmd '%s/set background=light/set background=dark'
  vim.cmd 'wqa'
end, { desc = 'turn dark mode on' })
--[[
vim.keymap.set('n', '<leader>es', '<cmd>vsplit<CR><cmd>e tmp73.txt<CR>12<C-w><<C-W>h', { desc = 'start easycrypt window' })
vim.keymap.set('n', '<leader>er', function()
  vim.cmd 'wall'
  vim.cmd 'AsyncRun cat "$(VIM_FILENAME)" | easycrypt > tmp73.txt'
end, { desc = 'run easycrypt command' })
vim.keymap.set('n', '<leader>ew', '<C-W>l<cmd>e! tmp73.txt<CR>gg0/check<CR>NVggd<C-W>h', { desc = 'display easycrypt window' })
]]
--
-- Neorg keymaps
-- vim: ts=2 sts=2 sw=2 et
