local norg_enable = { 'norg', 'tex' }
return {
  {
    'vhyrro/luarocks.nvim',
    ft = norg_enable,
    commit = '1db9093',
    dependencies = {
      { 'MunifTanjim/nui.nvim', commit = '61574ce' },
      { 'nvim-neotest/nvim-nio', version = '1.10.0' },
      { 'nvim-neorg/lua-utils.nvim', version = '1.0.2' },
      { 'nvim-lua/plenary.nvim', commit = 'f7adfc4' },
      { 'pysan3/pathlib.nvim', version = '2.2.3' },
    },
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    version = 'v9.0.0',
    ft = norg_enable,
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {
            config = {
              icons = {
                todo = {
                  done = {
                    icon = 'O',
                  },
                  on_hold = {
                    icon = 'H',
                  },
                  pending = {
                    icon = 'P',
                  },
                  uncertain = {
                    icon = 'U',
                  },
                },
              },
            },
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
                homework = '~/homework',
                todo = '~/todo/',
              },
              default_workspace = 'todo',
            },
          },
        },
      }
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
