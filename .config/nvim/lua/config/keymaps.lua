vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- yank to clipboard
vim.keymap.set("n", "<leader>y", "\" +y")
vim.keymap.set("v", "<leader>y", "\" +y")
vim.keymap.set("n", "<leader>Y", "\" +y")
