-- See `:help vim.opt`
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Show which line your cursor is on
vim.opt.cursorline = true
vim.g.have_nerd_font = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- 4 spaces for tab indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
-- Setting defaults
vim.cmd 'set makeprg=make'
vim.cmd 'set grepprg=rg\\ --vimgrep'
vim.cmd 'set redrawtime=6000'
-- Set *.fs to be Forth instead of FSharp
vim.cmd 'autocmd BufNewFile,BufRead *.fs set filetype=forth'
vim.diagnostic.config { virtual_text = true }
-- color
vim.cmd 'set background=dark'
vim.cmd 'packadd cfilter'
-- vim: ts=2 sts=2 sw=2 et
