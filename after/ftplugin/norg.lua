vim.keymap.set('n', '<Leader>v', '<Plug>(neorg.esupports.hop.hop-link.vsplit)', { buffer = true })
vim.cmd 'nnoremap <leader>p :lua require("nabla").popup()<CR> " Customize with popup({border = ...})  : `single` (default), `double`, `rounded`'
vim.cmd 'nnoremap <leader>P :lua require"nabla".toggle_virt()<CR>'
