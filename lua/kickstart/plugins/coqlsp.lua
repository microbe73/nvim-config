return {
  enabled = false,
  {
    'tomtomjhj/coq-lsp.nvim',
    init = function()
      vim.cmd 'let g:loaded_coqtail = 1'
      vim.cmd 'let g:coqtail#supported = 0'
      require('coq-lsp').setup()
    end,
  },
}
