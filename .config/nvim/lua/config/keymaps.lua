vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- yank to clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
vim.keymap.set('n', '<leader>ya', 'ggVG\"+y')

-- go specific mappings
vim.keymap.set('n', '<leader>dt', function()
  require('dap-go').debug_test()
end)

vim.keymap.set('n', '<leader>ds', function()
  require('dap').continue()
end)

vim.keymap.set('n', '<leader>df', function()
  vim.diagnostic.open_float(nil, { focusable = true })
end, {})

vim.keymap.set(
    'n',
    '<leader>er',
    'oif err != nil {<CR>}<Esc>Oreturn err<Esc>'
)

-- LSP specific
vim.keymap.set('n', '<leader>rn', function()
  vim.lsp.buf.rename()
end, { desc = 'Rename symbol' })

-- github copilot
vim.keymap.set('n', '<leader>ce', function()
  vim.cmd('Copilot enable')
end, { silent = true })

vim.keymap.set('n', '<leader>cd', function()
  vim.cmd('Copilot disable')
end, { silent = true })

-- formatting
vim.keymap.set('n', '<leader>f', function()
    require('conform').format({ bufnr = 0, lsp_fallback = true })
end)
