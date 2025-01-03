vim.cmd 'inoremap $      $  $<Left><Left>'
vim.cmd 'inoremap $$     $$'
vim.keymap.set('n', '<leader>mn', '<cmd>read MathNotes.tex<CR>', { desc = 'copy notes template into file' })
vim.diagnostic.config { virtual_text = false }
vim.cmd 'highlight Conceal ctermfg = 106 guifg=#8da101'
