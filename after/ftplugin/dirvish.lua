vim.keymap.set("n", "<C-s>", "<cmd>sort /\\.[^.]*$/ r<CR>", { buffer = true, desc = "Sort by extension" })
