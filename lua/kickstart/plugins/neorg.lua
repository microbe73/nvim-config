local norg_enable = { 'norg' }
return {
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim', ft = norg_enable },
    version = 'v9.0.0',
    ft = norg_enable,
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.presenter'] = { config = { zen_mode = 'zen-mode' } },
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
                code_block = {
                  -- If true will only dim the content of the code block (without the
                  -- `@code` and `@end` lines), not the entirety of the code block itself.
                  -- content_only = true,
                  -- The width to use for code block backgrounds.
                  --
                  -- When set to `fullwidth` (the default), will create a background
                  -- that spans the width of the buffer.
                  --
                  -- When set to `content`, will only span as far as the longest line
                  -- within the code block.
                  -- width = 'content',

                  -- Additional padding to apply to either the left or the right. Making
                  -- these values negative is considered undefined behaviour (it is
                  -- likely to work, but it's not officially supported).
                  padding = {
                    -- left = 20,
                    -- right = 20,
                  },

                  -- If `true` will conceal (hide) the `@code` and `@end` portion of the code
                  -- block.
                  conceal = true,

                  --nodes = { 'ranged_verbatim_tag' },
                  -- highlight = 'CursorLine',
                  -- render = module.public.icon_renderers.render_code_block,
                  -- insert_enabled = true,
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
      vim.keymap.set('n', '<leader>np', '<Plug>(neorg.presenter.next-page)', {})
      vim.keymap.set('n', '<leader>nP', '<Plug>(neorg.presenter.previous-page)', {})
      vim.keymap.set('n', '<leader>nc', '<Plug>(neorg.presenter.close)', {})
    end,
  },
}
