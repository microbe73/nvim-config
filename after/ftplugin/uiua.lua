vim.keymap.set('n', '<leader>ur', function()
  local filename = vim.api.nvim_buf_get_name(0)
  vim.cmd 'split'
  vim.cmd 'terminal'
  vim.fn.feedkeys 'a'
  local enter = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
  vim.fn.feedkeys('clear' .. enter)
  vim.fn.feedkeys('uiua run ' .. filename .. enter)
end)

local function get_documentation()
  local col = math.floor(vim.o.columns / 2)
  local row = math.floor(vim.o.lines / 3)
  local buf = vim.api.nvim_create_buf(false, true)
  local win_config = {
    relative = 'editor',
    width = 120,
    height = 20,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
  }
  vim.api.nvim_open_win(buf, true, win_config)
  vim.cmd 'terminal'
  vim.api.nvim_input 'auiua doc <esc>pa<CR>'
end
vim.keymap.set('n', '<leader>uh', function()
  get_documentation()
end)
