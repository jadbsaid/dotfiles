return {
    "nvim-telescope/telescope.nvim",
    version = '*',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git/" },
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                    '--hidden',
                }
            },
        })
        telescope.load_extension('fzf')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fc', function()
            builtin.find_files { cwd = vim.fn.stdpath('config') }
        end)
        vim.keymap.set('n', '<leader>fs', function()
            builtin.find_files { cwd = vim.fn.expand('~/src') }
        end)
        vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Find git files' })
        vim.keymap.set('n', '<leader>fw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>fW', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>fg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}
