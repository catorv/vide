---@class VideWinOptions
---@field buffer? number Buffer to display, or 0 for current buffer
---@field enter? boolean Enter the window (make it the current window), Default is true.
---@field relative? "editor"|"win"|"cursor"|"mouse" Sets the window layout to "floating", placed at (row,col) coordinates relative to:
---@field win? number window-ID window to split, or relative window when creating a float (relative="win").
---@field anchor? "NW"|"NE"|"SW"|"SE" Decides which corner of the float to place at (row,col), Default is "NW".
---@field width? number Window width (in character cells).
---@field height? number Window height (in character cells).
---@field bufpos? number[] Places float relative to buffer text (only when relative="win"). Takes a tuple of zero-indexed [line, column].
---@field row? number Row position in units of "screen cell height", may be fractional.
---@field col? number Column position in units of "screen cell width", may be fractional.
---@field focusable? number Enable focus by user actions (wincmds, mouse events). Defaults to true. Non-focusable windows can be entered by nvim_set_current_win(). row and col if given are applied relative to this position, else they default to: row=1 and col=0 if anchor is "NW" or "NE", row=0 and col=0 if anchor is "SW" or "SE" (thus like a tooltip near the buffer text).
---@field external? any GUI should display the window as an external top-level window. Currently accepts no other positioning configuration together with this.
---@field zindex? number Stacking order. floats with higher zindex go on top on floats with lower indices. Must be larger than zero.
---@field style? string Configure the appearance of the window. Currently only supports one value: "minimal"
---@field border? "none"|"single"|"double"|"rounded"|"solid"|"shadow"|"top"|string[] style of window border. This can either be a string or an array. default is "top"
---@field title? string|string[] Title in window border, string or list. List should consist of [text, highlight] tuples. If string, the default highlight group is FloatTitle.
---@field title_pos? "left"|"center"|"right" Title position. Must be set with title option. Value can be one of "left", "center", or "right". Default is "left", or "center" if border is "top".
---@field footer? string|string[] Footer in window border, string or list. List should consist of [text, highlight] tuples. If string, the default highlight group is FloatFooter.
---@field footer_pos? "left"|"center"|"right" Footer position. Must be set with footer option. Value can be one of "left", "center", or "right". Default is "left".
---@field noautocmd? boolean If true then no buffer-related autocommand events such as BufEnter, BufLeave or BufWinEnter may fire from calling this function.
---@field fixed? boolean If true when anchor is NW or SW, the float window would be kept fixed even if the window would be truncated.
---@field hide? boolean If true the floating window will be hidden.
---@field vertical? boolean Split vertically
---@field split? "left"|"right"|"above"|"below" Split direction
---@see https://neovim.io/doc/user/api.html#nvim_open_win()

---@class VideWin
---@field buf number
---@field win number
---@field opts VideWinOptions
local M = {}

---新建并打开一个新窗口
---参数定义详见 https://neovim.io/doc/user/api.html#nvim_open_win()
---@param opts VideWinOptions
function M.open(opts)
  local self = setmetatable({}, { __index = M })
  return self:init(opts)
end

---初始化并返回一个窗口对象
---@param opts? VideWinOptions
function M:init(opts)
  self.opts = vim.tbl_extend("force", {
    enter = true,
    width = 0.8,
    height = 0.8,
    style = "minimal",
    zindex = 50,
  }, opts)

  if not self.opts.border then
    self.opts.border = self.opts.relative and "top" or "none"
  end

  if self.opts.buffer then
    self.buf = self.opts.buffer
    self.opts.buffer = nil
  else
    self.buf = vim.api.nvim_create_buf(false, true)
  end

  ---@diagnostic disable-next-line: param-type-mismatch
  vide.util.debug(opts)

  return self
end

return M
