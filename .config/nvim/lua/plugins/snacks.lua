return
{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = false },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                -- wo = { wrap = true } -- Wrap notifications
            }
        }
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
        { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
        { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
        { "<leader>ex",      function() Snacks.explorer() end,                                       desc = "File Explorer" },
        -- find
        { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
        { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
        -- git
        { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
        { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
        { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
        { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
        -- Grep
        { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
        { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
        { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
        -- search
        { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
        { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
        { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
        { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
        { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
        { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
        { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
        { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
        -- LSP
        { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
        { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
        { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                  desc = "References" },
        { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
        -- Other
        { "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
        { "<leader>.",       function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
        { "<leader>S",       function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
        { "<leader>n",       function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
        { "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
        { "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse",            mode = { "n", "v" } },
        { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
        { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
        { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",        mode = { "n", "t" } },
        { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",        mode = { "n", "t" } },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd     -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.diagnostics():map("<leader>td")
                Snacks.toggle.line_number():map("<leader>ul")
                    :map("<leader>uc")
                Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map(
                    "<leader>tb")
            end,
        })
    end,
}
