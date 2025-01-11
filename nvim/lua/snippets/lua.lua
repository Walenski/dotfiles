-- ~/.config/nvim/lua/snippets/lua.lua

local ls = require("luasnip")  -- Import LuaSnip
local s = ls.snippet           -- Alias for snippet constructor
local t = ls.text_node         -- Alias for text node constructor
local i = ls.insert_node       -- Alias for insert node constructor

-- Define Lua-specific snippets
ls.add_snippets("lua", {
  s("func", {
    t("local function "), i(1, "name"), t("("), i(2, "args"), t({")", "  "}),
    i(0),
    t({"", "end"})
  }),
})

