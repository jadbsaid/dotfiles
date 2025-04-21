return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>z", function()
            require("zen-mode").setup {
                window = {
                    width = .50,
                    options = { }
                },
            }
            require("zen-mode").toggle()
            vim.wo.rnu = true
            vim.wo.wrap = false
            vim.wo.number = true
        end)
    end
}
