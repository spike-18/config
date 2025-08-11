return {
  { "fei6409/log-highlight.nvim", event = "BufRead *.log", opts = {} },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "cmake",
        "css",
        "gitcommit",
        "gitignore",
        "http",
        "meson",
        "ninja",
        "sql",
        "c",
        "cpp",
        "objdump",
        "python",
      })
    end,
  },
}
