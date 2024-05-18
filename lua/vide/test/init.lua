local function reload()
  for name, _ in pairs(package.loaded) do
    if name ~= "vide.test" and name:match("^vide") then
      package.loaded[name] = nil
      require(name)
    end
  end
  package.loaded["vide.test"] = nil
  require("vide.test")
end
vim.keymap.set("n", "<F5>", reload)
-- lua require('vide.test')

-- local mods = {}
-- vide.util.walkmods("./lua/vide", function(modname, modpath)
--   table.insert(mods, { modname = modname, path = modpath })
-- end, "vide")
-- vide.util.debug(mods)

-- vide.ui.open
require("vide.ui.win_spec")
----------------------------------

-- print(vide.util.normname("vide.nvim"))
-- print("-x-")

-- print(vide.util.dump(vim.api.nvim_win_get_position(0)))

-- local function test_fn()
--   print(vide.util.get_source())
-- end
--
-- test_fn()

-- vide.util.float_cmd({ "ls", "-l" })

-- local uv = vim.uv or vim.loop
--
-- print(1)
-- vim.notify("start", vim.log.levels.DEBUG, {})
-- vide.util.debug("start")
-- local timer = uv.new_timer()
-- timer:start(3000, 0, function()
--   print("is_thread: " .. tostring(vim.is_thread()))
-- end)

-- vim.o.lines vim.o.columns
