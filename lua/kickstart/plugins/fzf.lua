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
        builtin = {
          ['<S-Right>'] = 'toggle-preview',
        },
      },
      winopts = {
        preview = { hidden = true },
      },
    }, true)
    vim.keymap.set('n', '<leader>sh', fzf.helptags, { desc = 'Search Help' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = 'Search Keymaps' })
    vim.keymap.set('n', '<leader>sf', fzf.files, { desc = 'Search Files' })
    vim.keymap.set('n', '<leader>sg', fzf.live_grep_glob, { desc = 'Search by Grep' })
    vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = 'Search [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = 'Search Resume' })
    vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>sb', fzf.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sQ', fzf.quickfix_stack, { desc = 'search qf lists history' })
    vim.keymap.set('n', '<leader>sq', fzf.quickfix, { desc = 'search qf list entries' })
    vim.keymap.set('n', '<leader>sc', fzf.command_history, { desc = 'search command history' })
    vim.keymap.set('v', '<leader>sv', fzf.grep_visual, { desc = 'Grep visual selection' })
    vim.keymap.set('n', '<leader>sn', function()
      fzf.files { cwd = '~/.config/nvim' }
    end, { desc = '[S]earch [N]eovim files' })
    vim.keymap.set('n', '<leader>sm', fzf.manpages, { desc = 'Search manual pages' })
    vim.keymap.set('n', '<leader>s/', fzf.grep_curbuf, { desc = 'Grep in current buffer' })
  end,
}
