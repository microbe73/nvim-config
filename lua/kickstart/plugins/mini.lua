return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        tabline = {
          lualine_a = {
            {
              'buffers',
              show_filename_only = true, -- Shows shortened relative path when set to false.
              hide_filename_extension = false, -- Hide filename extension when set to true.
              show_modified_status = true, -- Shows indicator when the buffer is modified.
              filetype_names = {
                TelescopePrompt = 'Telescope',
                dashboard = 'Dashboard',
                packer = 'Packer',
                fzf = 'FZF',
                alpha = 'Alpha',
              },
              mode = 0, -- 0: Shows buffer name
              -- 1: Shows buffer index
              -- 2: Shows buffer name + buffer index
              -- 3: Shows buffer number
              -- 4: Shows buffer name + buffer number

              max_length = vim.o.columns * 2 / 3,
            },
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = {
            {
              'filename',
              path = 3,
              newfile_status = true,
              symbols = { modified = '+', readonly = '-', unnamed = '[No Name]' },
            },
          },
          lualine_x = { { 'filetype', icon_only = true } },
          lualine_y = { 'diagnostics' },
          lualine_z = { 'location' },
        },
      }
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Goto buffer in position...
      map('n', '<A-1>', '<Cmd>LualineBuffersJump! 1<CR>', opts)
      map('n', '<A-2>', '<Cmd>LualineBuffersJump! 2<CR>', opts)
      map('n', '<A-3>', '<Cmd>LualineBuffersJump! 3<CR>', opts)
      map('n', '<A-4>', '<Cmd>LualineBuffersJump! 4<CR>', opts)
      map('n', '<A-5>', '<Cmd>LualineBuffersJump! 5<CR>', opts)
      map('n', '<A-6>', '<Cmd>LualineBuffersJump! 6<CR>', opts)
      map('n', '<A-7>', '<Cmd>LualineBuffersJump! 7<CR>', opts)
      map('n', '<A-8>', '<Cmd>LualineBuffersJump! 8<CR>', opts)
      map('n', '<A-9>', '<Cmd>LualineBuffersJump! 9<CR>', opts)
      map('n', '<A-0>', '<Cmd>LualineBuffersJump! $<CR>', opts)
      map('n', '<A-c>', '<Cmd>bdelete<CR>', opts)
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
