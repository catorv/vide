local start = vim.uv.hrtime()

if vim.version().minor < 10 then
  vim.notify_once("vide: you must use neovim 0.10 or higher")
  return
end

---@class Vide
local M = {}

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

local uname = vide.util.uname()
local target
if uname.os == "macos" then
  if uname.machine == "arm64" or uname.machine == "aarch64" then
    target = "aarch64_apple_darwin"
  elseif uname.machine == "x86_64" then
    target = "x86_64_apple_darwin"
  end
elseif uname.os == "linux" then
  if uname.machine == "x86_64" then
    target = "x86_64_unknown_linux_gnu"
  elseif uname.machine == "arm64" or uname.machine == "aarch64" then
    target = "aarch64_unknown_linux_gnu"
  elseif uname.machine == "i686" then
    target = "i686_unknown_linux_gnu"
  end
elseif uname.os == "windows" then
  if uname.machine == "x86_64" then
    target = "x86_64_pc_windows_msvc"
  elseif uname.machine == "arm64" or uname.machine == "aarch64" then
    target = "aarch64_pc_windows_msvc"
  elseif uname.machine == "i686" then
    target = "i686_pc_windows_msvc"
  end
end
if target then
  local ok, mod = pcall(require, "vide_" .. target)
  if ok then
    vide.api = mod
    vide.api.init()
  end
end

vim.g.vide_startuptime = vim.uv.hrtime() - start
