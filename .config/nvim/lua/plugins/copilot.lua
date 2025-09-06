return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
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
