return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- Confirm completion with Tab
        ["<Tab>"] = { "accept", "fallback" },
        -- Navigate completion menu
        ["<S-Tab>"] = { "select_prev", "fallback" },
        -- Enter will always newline, never auto-accept
        ["<CR>"] = { "fallback" },
        -- Optional: Ctrl+Space to manually trigger completion
        ["<C-Space>"] = { "show", "show_documentation" },
      },
      completion = {
        -- Show the completion menu as you type
        autocomplete = true,
        -- Optional: don't select first item automatically
        select_first = false,
      },
      sources = {
        -- Enable LSP and snippets
        default = { "lsp", "path", "buffer", "snippets" },
      },
    },
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
}
