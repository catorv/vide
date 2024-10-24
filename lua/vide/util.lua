---@class VideUtil
local M = setmetatable({}, { __index = require("lazy.util") })

---Overrides lazy.core.util.debug(msg, opts)
---@param msg string|table
---@param opts? LazyNotifyOpts
function M.debug(msg, opts)
  -- TODO: 修改为vide的配置项
  -- if not require("lazy.core.config").options.debug then
  --   return
  -- end
  opts = opts or {}
  if opts.title then
    opts.title = "vide: " .. opts.title
  end
  if type(msg) == "string" then
    M.notify(msg, opts)
  else
    opts.lang = "lua"
    M.notify(vim.inspect(msg), opts)
  end
end

---获取操作系统名称
---@return UnameInfo
function M.uname()
  ---@type UnameInfo
  ---@diagnostic disable-next-line: assign-type-mismatch
  local result = vim.uv.os_uname()
  if result.sysname == "Darwin" then
    result.os = "macos"
  elseif result.sysname == "Linux" then
    result.os = "linux"
  elseif result.sysname:find("Windows") ~= nil then
    result.os = "windows"
  else
    result.os = "unknown"
  end
  return result
end

return M
