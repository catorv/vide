---@class Vide
---@field util VideUtil
---@field ui VideUI
local M = {}

---@class LazyModuleOptions
---@field prefix string 模块前缀(不包含最后一个".")
---@field aliases? table 别名表

---定义一个惰性加载模块
---@generic T
---@param module T 要处理的模块
---@param opts LazyModuleOptions|string
---@return T @返回惰性加载模块
function M.lazy_module(module, opts)
  if type(opts) == "string" then
    opts = { prefix = opts }
  end
  setmetatable(module, {
    __index = function(tbl, key)
      local name = key
      if opts.aliases and opts.aliases[name] then
        name = opts.aliases[name]
      end
      local ok, mod = pcall(require, opts.prefix .. "." .. name)
      if not ok then
        vim.notify("no such module: " .. opts.prefix .. "." .. name, vim.log.levels.ERROR)
      end
      tbl[key] = mod
      return mod
    end,
  })
  return module
end

_G.vide = M.lazy_module(M, "vide")
