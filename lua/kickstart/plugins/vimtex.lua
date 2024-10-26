return {
  {
    'lervag/vimtex',
    ft = 'tex',
    init = function()
      -- Use init for configuration, don't use the more common "config".
      vim.diagnostic.config { virtual_text = false }
      vim.g.vimtex_view_method = 'sioyek'
      vim.g.vimtex_view_sioyek_exe = '/Applications/sioyek.app/Contents/MacOS/sioyek'
      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_complete_close_braces = 1
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.cmd 'set conceallevel=2'
      vim.cmd [[let g:vimtex_syntax_conceal = {
          \ 'accents': 1,
          \ 'ligatures': 1,
          \ 'cites': 1,
          \ 'fancy': 1,
          \ 'spacing': 1,
          \ 'greek': 1,
          \ 'math_bounds': 1,
          \ 'math_delimiters': 1,
          \ 'math_fracs': 1,
          \ 'math_super_sub': 1,
          \ 'math_symbols': 1,
          \ 'sections': 1,
          \ 'styles': 1,
          \}
]]
    end,
  },
}
