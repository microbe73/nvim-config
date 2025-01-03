return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  init = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ['i'] = {
              -- your custom insert mode mappings
            },
            ['n'] = {
              vim.keymap.set('n', '<space>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>'),
            },
          },
        },
      },
    }
    require('telescope').load_extension 'file_browser'
  end,
}
