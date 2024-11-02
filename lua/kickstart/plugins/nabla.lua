return {
  {
    'jbyuki/nabla.nvim',
    ft = { 'norg', 'txt' },
    init = function()
      vim.cmd 'nnoremap <leader>p :lua require("nabla").popup()<CR> " Customize with popup({border = ...})  : `single` (default), `double`, `rounded`'
      vim.cmd 'nnoremap <leader>P :lua require"nabla".toggle_virt()<CR>'
    end,
  },
}
