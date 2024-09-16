local bufnr = 2
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('Save', { clear = true }),
  pattern = '*.c',
  callback = function()
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { 'Output of compiling file: ' })
    vim.fn.jobstart({ 'gcc', 'set_index.c', '-o', 'set_index' }, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end,
      on_stderr = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end,
    })
  end,
})
