return {
  {
    'whonore/Coqtail',
    commit = 'ac6e91f',
    ft = 'coq',
    init = function()
      vim.cmd 'filetype plugin on'
      vim.cmd "let b:coqtail_coq_path = '/Applications/Coq-Platform~8.18~2023.11.app/Contents/Resources/bin/'"
    end,
  },
}
