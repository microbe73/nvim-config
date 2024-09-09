return {
  {
    'lervag/vimtex',
    ft = 'tex',
    init = function()
      -- Use init for configuration, don't use the more common "config".
      vim.g.vimtex_view_method = 'sioyek'
      vim.g.vimtex_view_sioyek_exe = '/Applications/sioyek.app/Contents/MacOS/sioyek'
      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_complete_close_braces = 1
      vim.g.vimtex_quickfix_open_on_warning = 0
    end,
  },
}
