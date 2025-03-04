return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  config = function()
    local fzf = require 'fzf-lua'
    fzf.setup({
      keymap = {
        fzf = {
          ['ctrl-q'] = 'select-all+accept',
        },
      },
    }, true)
    vim.keymap.set('n', '<leader>sh', fzf.helptags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', fzf.live_grep_glob, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>sb', fzf.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sq', fzf.quickfix_stack, { desc = 'search qf list history' })
    vim.keymap.set('n', '<leader>sn', function()
      fzf.files { cwd = '~/.config/nvim' }
    end, { desc = '[S]earch [N]eovim files' })
    vim.keymap.set('n', '<leader>sm', fzf.manpages, { desc = 'Search manual pages' })
    vim.keymap.set('n', '<leader>s/', fzf.grep_curbuf, { desc = 'Grep in current buffer' })
    vim.keymap.set({ 'n', 'v', 'i' }, '<C-x><C-f>', function()
      require('fzf-lua').complete_path()
    end, { silent = true, desc = 'Fuzzy complete path' })
  end,
}
