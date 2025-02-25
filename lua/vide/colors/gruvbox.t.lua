---@class Gruvbox
---@field config GruvboxConfig

---颜色对比度
---@alias GruvboxContrast "soft" | "medium" | "hard"

---配置何时使用斜体字
---@class GruvboxItalicConfig
---@field strings boolean 字符串是否使用斜体字
---@field comments boolean 注释是否使用斜体字
---@field operators boolean 运算符是否使用斜体字
---@field folds boolean 代码折叠是否使用斜体字
---@field emphasis boolean 强调文本是否使用斜体字

---Gruvbox 配置
---@class GruvboxConfig
---@field terminal_colors boolean? 是否配置终端颜色
---@field undercurl boolean? 是否使用波浪下划线
---@field underline boolean? 是否使用下划线
---@field bold boolean? 是否使用粗体字
---@field italic GruvboxItalicConfig?
---@field strikethrough boolean? 是否使用删除线
---@field contrast GruvboxContrast?
---@field invert_selection boolean? 是否反相显示选中内容
---@field invert_signs boolean? 是否反相显示符号栏
---@field invert_tabline boolean? 是否反相显示TabLine
---@field invert_intend_guides boolean? 是否反相显示缩进参考
---@field inverse boolean? 是否使用反相显示
---@field overrides table<string, HighlightDefinition>? 覆盖高亮定义配置
---@field palette_overrides table<string, string>? 覆盖调色板定义
---@field dim_inactive boolean? 非当前窗口背影色调暗
---@field transparent_mode boolean? 窗口背景透明

---调色板
---@class GruvboxPalette
---@field bg0 string?
---@field bg0_hard string?
---@field bg0_soft string?
---@field bg1 string?
---@field bg2 string?
---@field bg3 string?
---@field bg4 string?
---@field gray string?
---@field fg4 string?
---@field fg3 string?
---@field fg2 string?
---@field fg1 string?
---@field fg0 string?
---@field line0 string? 窗口分割线
---@field line1 string? 辅助线（高亮）
---@field line2 string? 辅助线（正常）
---@field line3 string? 辅助线（背景）
---@field red string?
---@field green string?
---@field yellow string?
---@field blue string?
---@field purple string?
---@field aqua string?
---@field orange string?
---@field neutral_red string?
---@field neutral_green string?
---@field neutral_yellow string?
---@field neutral_blue string?
---@field neutral_purple string?
---@field neutral_aqua string?
---@field neutral_orange string?
---@field dim_red string?
---@field dim_red_hard string?
---@field dim_red_soft string?
---@field dim_green string?
---@field dim_green_hard string?
---@field dim_green_soft string?
---@field dim_aqua string?
---@field dim_aqua_hard string?
---@field dim_aqua_soft string?

---@class HighlightDefinition
---@field fg string?
---@field bg string?
---@field sp string?
---@field blend integer?
---@field bold boolean?
---@field standout boolean?
---@field underline boolean?
---@field undercurl boolean?
---@field underdouble boolean?
---@field underdotted boolean?
---@field strikethrough boolean?
---@field italic boolean?
---@field reverse boolean?
---@field nocombine boolean?
