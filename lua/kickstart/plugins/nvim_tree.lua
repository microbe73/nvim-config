return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 25,
        side = 'right',
      },
      vim.keymap.set('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>'),
    }
  end,
}
