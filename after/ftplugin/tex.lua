local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.add_rule(Rule("$"," $","tex"))
vim.keymap.set('n', '<leader>mn', '<cmd>read MathNotes.tex<CR>', { desc = 'copy notes template into file' })
vim.cmd 'highlight Conceal ctermfg = 106 guifg=#8da101'
vim.diagnostic.config {
  underline = false,
  signs = { severity = { min = vim.diagnostic.severity.E } },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
}
vim.keymap.set('i', '<C-f>', '<Esc>f$a')
vim.cmd 'set textwidth=94'
