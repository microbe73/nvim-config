vim.diagnostic.config {
  underline = false,
  signs = { severity = { min = vim.diagnostic.severity.E } },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
}
vim.cmd 'set errorformat+=%f:%l.%c-%e.%k%m'
vim.cmd 'set errorformat+=%f:%l.%c%k%m'
vim.cmd 'set errorformat+=%f:%l.%c%m'

