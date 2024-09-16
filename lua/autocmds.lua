-- Buffer to output results: generally when editing keep small and then open when saving/running
local bufnr = 2
-- C autocommand, save on write
--
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('Save', { clear = true }),
  pattern = '*.c',
  callback = function()
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { 'Output of compiling file: ' })
    vim.fn.jobstart({ 'gcc', vim.fn.expand '%', '-o', string.sub(vim.fn.expand '%', 1, -3) }, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, data)
        end
      end,
      on_stderr = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, data)
        end
      end,
    })
  end,
})
