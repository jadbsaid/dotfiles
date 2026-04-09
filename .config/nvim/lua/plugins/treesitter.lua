return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      ts.install({
        "lua",
        "vimdoc",
        "javascript",
        "typescript",
        "c",
        "rust",
        "bash",
        "svelte",
        "tsx",
        "go",
        "http",
        "sql",
        "html",
        "markdown",
        "markdown_inline",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local buf = args.buf
          local ft = vim.bo[buf].filetype

          pcall(vim.treesitter.start, buf)

          if ft == "markdown" then
            vim.bo[buf].syntax = "ON"
          end
        end,
      })

      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          pcall(vim.treesitter.start, buf)
        end
      end
    end,
  },
}
