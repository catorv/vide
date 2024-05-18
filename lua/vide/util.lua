---@class VideUtil: LazyUtil
local M = setmetatable({}, { __index = require("lazy.util") })

---Overrides lazy.core.util.debug(msg, opts)
---@param msg string|table
---@param opts? LazyNotifyOpts
function M.debug(msg, opts)
  -- TODO: 修改为vide的配置项
  if not require("lazy.core.config").options.debug then
    return
  end
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

return M
