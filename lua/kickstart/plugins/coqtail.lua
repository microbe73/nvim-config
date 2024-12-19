return {
  {
    'whonore/Coqtail',
    ft = 'coq',
    init = function()
      vim.cmd 'filetype plugin on'
      vim.cmd "let b:coqtail_coq_path = '~/.opam/default/bin/'"
    end,
  },
  {
    'tomtomjhj/coq-lsp.nvim',
    ft = { 'coq' },
    init = function()
      vim.cmd [[let g:loaded_coqtail = 1
      let g:coqtail#supported = 0]]
      require('coq-lsp').setup {
        lsp = {
          on_attach = function(client, bufnr)
            -- your mappings, etc
          end,
          -- coq-lsp server initialization configurations, defined here:
          -- https://github.com/ejgallego/coq-lsp/blob/main/editor/code/src/config.ts#L3
          -- Documentations are at https://github.com/ejgallego/coq-lsp/blob/main/editor/code/package.json.
          init_options = {
            show_notices_as_diagnostics = true,
            unicode_completion = 'normal',
            show_stats_on_hover = true,
          },
          autostart = true, -- use this if you want to manually launch coq-lsp with :LspStart.
        },
      }
      vim.cmd 'highlight DiagnosticVirtualTextInfo ctermfg = 10 guifg=LightGreen'
    end,
  },
} -- DiagnosticInfo xxx ctermfg=4 guifg=LightBlue
