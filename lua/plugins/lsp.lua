return {

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = { prefix = "icons" } },
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      },
      servers = {
        lua_ls = {
          -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
          -- single_file_support = true,
          settings = {
            Lua = {
              misc = {
                -- parameters = { "--loglevel=trace" },
              },
              hover = { expandAlias = false },
              type = {
                castNumberToInteger = true,
                inferParamType = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
            },
          },
        },
      },
    },
  },

  -- Lightweight yet powerful formatter plugin for Neovim
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      linters_by_ft = {
        lua = { "selene", "luacheck" },
        python = { "ruff_organize_imports", "ruff_format" },
        rust = { "rustfmt" },
	c = { "clang_format" },
	cpp = { "clang_format" }
      },
      formatters = {},
    },
  },

}
