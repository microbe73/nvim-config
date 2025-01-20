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
vim.keymap.set('n', '<leader>qo', function()
  vim.diagnostic.setqflist { severity = { min = vim.diagnostic.severity.E } }
end, { desc = 'Open qf list' })
