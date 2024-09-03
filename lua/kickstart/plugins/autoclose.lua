return {
  {
    'm4xshen/autoclose.nvim',
    keys = {
      ['$'] = { escape = false, close = true, pair = '$$', enabled_filetypes = { 'latex' } },
      ['{'] = { escape = false, close = true, pair = '{}' },
      ['('] = { escape = false, close = true, pair = '()' },
      ['"'] = { escape = false, close = true, pair = '""' },
      ["'"] = { escape = false, close = true, pair = "''" },
      [')'] = { escape = true, close = false, pair = '()' },
      [']'] = { escape = true, close = false, pair = '[]' },
      ['}'] = { escape = true, close = false, pair = '{}' },
    },
    options = {
      disable_when_touch = true,
    },
  },
}
