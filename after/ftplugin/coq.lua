vim.cmd 'highlight DiagnosticVirtualTextInfo ctermfg = 10 guifg=LightGreen'
vim.lsp.start {
  name = 'coq-lsp',
  cmd = { 'coq-lsp' },
  filetypes = { 'coq' },
  root_dir = vim.fs.root(0, { '.git', '_CoqProject' }),
  single_file_support = true,
}
vim.diagnostic.config {
  underline = false,
  signs = { severity = { min = vim.diagnostic.severity.E } },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
}

vim.keymap.set('n', '<leader>Cr', function()
  vim.cmd 'vsplit'
  vim.cmd 'terminal'
  local enter = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
  local wind_key = vim.api.nvim_replace_termcodes('<C-w>', true, true, true)
  vim.fn.feedkeys('10' .. wind_key .. '<' .. enter)
  vim.fn.feedkeys('acoqtop' .. enter)
end, { desc = 'Start coqtop in Terminal buffer' })

vim.keymap.set('v', '<leader>Cn', function()
  local cur_pos = vim.fn.getcursorcharpos(0)
  local orig_line = cur_pos[2]
  local next_pd = vim.fn.search '\\.' -- Regex thought
  local new_curs = vim.fn.cursor(next_pd, 1)
  vim.fn.feedkeys 'f.l'
  local new_pos = vim.fn.getcursorcharpos(0)
  local new_line = new_pos[2]
  local dist = new_line - orig_line
  local dist_str = string.format('%d', dist)
  vim.fn.feedkeys('y' .. dist_str .. 'k')
end)
