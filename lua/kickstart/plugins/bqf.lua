return {
  {
    'kevinhwang91/nvim-bqf',

    dependencies = { 'nvim-treesitter/nvim-treesitter', {
      'junegunn/fzf',
      build = function()
        vim.fn['fzf#install']()
      end,
    } },

    ft = 'qf',
    opts = {
      auto_enable = false,
    },
    init = function()
      vim.keymap.set('n', '<leader>qt', '<cmd>BqfToggle<CR>', { desc = 'toggle bqf' })
    end,
  },
}
