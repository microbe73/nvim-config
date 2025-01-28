-- lua/plugins/everforest.lua
return {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.everforest_background = 'hard'
    vim.cmd 'set background=light'
    vim.g.everforest_better_performance = 1
    vim.g.everforest_enable_italic = false
    vim.cmd.colorscheme 'everforest'
  end,
}
-- vim: ts=2 sts=2 sw=2 et
