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

  {
    "echasnovski/mini.align",
    opts = {},
    keys = {
      { "ga", mode = { "n", "v" } },
      { "gA", mode = { "n", "v" } },
    },
  },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },

  {
    "folke/lazydev.nvim",
    opts = function(_, opts)
      opts.debug = true
      opts.runtime = "~/projects/neovim/runtime"
      vim.list_extend(opts.library, {
        -- { path = "wezterm-types", mods = { "wezterm" } },
        { path = "${3rd}/luassert/library", words = { "assert" } },
        { path = "${3rd}/busted/library", words = { "describe" } },
      })
    end,
  },

  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function()
  --     vim.fn["mkdp#util#install"]()
  --   end,
  -- },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    cmd = { "PeekOpen", "PeekClose" },
    opts = {
      theme = "dark",
      app = "browser",
    },
    config = function(_, opts)
      local peek = require("peek")
      peek.setup(opts)

      -- Diagnostic command for PeekOpen
      vim.api.nvim_create_user_command("PeekOpen", function()
        print("[Peek Debug] Checking deno path...")
        local deno_exists = vim.fn.executable("deno")
        print("[Peek Debug] deno found? ", deno_exists == 1)

        if deno_exists == 0 then
          print("[Peek Debug] ERROR: deno not found in PATH")
        end

        print("[Peek Debug] Current filetype: " .. vim.bo.filetype)
        if vim.bo.filetype ~= "markdown" then
          print("[Peek Debug] WARNING: You are not in a markdown file")
        end

        print("[Peek Debug] Attempting to start Peek...")
        peek.open()

        vim.defer_fn(function()
          print("[Peek Debug] Peek is_open? ", peek.is_open())
        end, 1000)
      end, {})

      vim.api.nvim_create_user_command("PeekClose", peek.close, {})
    end,
    keys = {
      { "<leader>cp", "<cmd>PeekOpen<CR>", desc = "Preview markdown (Peek)" },
      { "<leader>cP", "<cmd>PeekClose<CR>", desc = "Close markdown preview (Peek)" },
    },
  },
}
