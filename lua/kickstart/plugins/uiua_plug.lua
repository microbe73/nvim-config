return {
  'Apeiros-46B/uiua.vim',
  ft = 'uiua',
  init = function()
    vim.g.uiua_path = '~/.cargo/bin/uiua'
    vim.g.uiua_dark_mode = false
    vim.cmd [[ hi def link uiuaForeground uiuaForegroundLight ]]
  end,
}
