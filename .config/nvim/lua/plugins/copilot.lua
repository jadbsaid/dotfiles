return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
            require("copilot").setup({
                filetypes = {
                    sh = function()
                        if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
                            return false
                        end
                        return true
                    end,
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    hide_during_completion = false,
                    debounce = 25,
                    keymap = {
                        accept = "<C-y>",
                        prev = "<C-p>",
                        next = "<C-n>",
                        dismiss = "<C-e>",
                    },
                },
            })
        end,
    },
}
