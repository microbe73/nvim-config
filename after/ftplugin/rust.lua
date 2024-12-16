vim.cmd 'set makeprg=cargo'
vim.keymap.set('n', '<leader>cr', '<cmd>split<CR><cmd>terminal<CR>acargo run<CR>')
