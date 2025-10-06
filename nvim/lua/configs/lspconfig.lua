require("nvchad.configs.lspconfig").defaults()

local servers = {
  bashls = {},
  clangd = {},
  hydra_lsp = {},
  jsonls = {},
  rust_analyzer = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end


-- read :h vim.lsp.config for changing options of lsp servers 
