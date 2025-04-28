local ft_enable = { 'norg', 'markdown', 'ipynb' }
return {
  'vhyrro/luarocks.nvim',
  ft = ft_enable,
  dependencies = {
    { 'MunifTanjim/nui.nvim', commit = '61574ce', ft = ft_enable },
    { 'nvim-neotest/nvim-nio', version = '1.10.0', ft = ft_enable },
    { 'nvim-neorg/lua-utils.nvim', version = '1.0.2', ft = ft_enable },
    { 'nvim-lua/plenary.nvim', commit = 'f7adfc4', ft = ft_enable },
    { 'pysan3/pathlib.nvim', version = '2.2.3', ft = ft_enable },
  },
  priority = 1000, -- We'd like this plugin to load first out of the rest
  opts = { rocks = { 'magick' } },
  config = true, -- This automatically runs `require("luarocks-nvim").setup()`
}
