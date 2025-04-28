return {
  {
    'whonore/Coqtail',
    ft = 'coq',
    init = function()
      vim.cmd 'filetype plugin on'
      vim.cmd "let b:coqtail_coq_path = '~/.opam/iris_tutorial/bin/'"
      vim.cmd 'let g:coqtail_noimap=1'
    end,
  },
} -- DiagnosticInfo xxx ctermfg=4 guifg=LightBlue
