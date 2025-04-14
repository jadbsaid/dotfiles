return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")

        require("dapui").setup()
        require("dap-go").setup()

        vim.keymap.set('n', "<Leader>b", dap.toggle_breakpoint, {})

        vim.keymap.set('n', "<F1>", dap.continue, {})
        vim.keymap.set('n', "<F7>", dap.step_into)
        vim.keymap.set('n', "<F8>", dap.step_over)
        vim.keymap.set('n', "<F9>", dap.step_out)
        vim.keymap.set('n', "<F10>", dap.step_back)
        vim.keymap.set('n', "<F12>", dap.restart)

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}
