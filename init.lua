-- Main nvim configuration file. 

-- detect if nvim is ran from VSCode
if vim.env.VSCODE then
  vim.g.vscode = true
end

-- enable faster lua module loading
if vim.loader then
  vim.loader.enable()
end


-- define global debug helpers
_G.dd = function(...)
  require("snacks.debug").inspect(...)
end

_G.bt = function(...)
  require("snacks.debug").backtrace()
end

_G.p = function(...)
  require("snacks.debug").profile(...)
end

vim.print = _G.dd

-- load optional environment config
pcall(require, "config.env")

-- load lazy.nvim plugin manager
require("config.lazy").load({
  profiling = {
    loader = false,
    require = true,
  },
})


