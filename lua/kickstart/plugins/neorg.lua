return {
  {
    'vhyrro/luarocks.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-neotest/nvim-nio',
      'nvim-neorg/lua-utils.nvim',
      'nvim-lua/plenary.nvim',
      'pysan3/pathlib.nvim',
    },
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    version = 'v9.0.0',
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
