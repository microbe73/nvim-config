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
vim.cmd 'tnoremap <Esc> <C-\\><C-n>'
vim.keymap.set('i', '<C-f>', '<Esc>f$a')
vim.keymap.set({ 'i', 'n' }, '<C-s>', '<Esc>:<C-f>i')
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>qo', '<cmd>copen<CR>', { desc = 'Open[Q]uickfix list' })
vim.keymap.set('n', '<leader>qc', '<cmd>cclose<CR>', { desc = 'Close qf list' })
vim.keymap.set('n', '<leader>j', '<cmd>cnext<CR>', { desc = 'next qf list item' })
vim.keymap.set('n', '<leader>k', '<cmd>cprev<CR>', { desc = 'prev qf list item' })
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

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

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
vim.keymap.set('n', '<leader>Lv', '<cmd>loadview<cr>', { desc = 'load saved view, useful for folds' })

vim.keymap.set('n', '<leader>Ll', function()
  vim.cmd 'edit ~/.config/alacritty/alacritty.toml'
  vim.cmd '%s/-dark-/-light-'
  vim.cmd 'edit ~/.config/nvim/lua/kickstart/plugins/tokyonight.lua'
  vim.cmd '%s/set background=dark/set background=light'
  vim.cmd 'wqa'
end, { desc = 'turn light mode on' })
vim.keymap.set('n', '<leader>Ld', function()
  vim.cmd 'edit ~/.config/alacritty/alacritty.toml'
  vim.cmd '%s/-light-/-dark-'
  vim.cmd 'edit ~/.config/nvim/lua/kickstart/plugins/tokyonight.lua'
  vim.cmd '%s/set background=light/set background=dark'
  vim.cmd 'wqa'
end, { desc = 'turn dark mode on' })
-- Neorg keymaps
-- vim: ts=2 sts=2 sw=2 et
