vim.cmd 'inoremap $      $  $<Left><Left>'
vim.cmd 'inoremap $$     $$'
vim.keymap.set('n', '<leader>mn', '<cmd>read MathNotes.tex<CR>', { desc = 'copy notes template into file' })
vim.cmd 'highlight Conceal ctermfg = 106 guifg=#8da101'
vim.diagnostic.config {
  underline = false,
  signs = { severity = { min = vim.diagnostic.severity.E } },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
}
