
local ls = require("luasnip")  -- Import LuaSnip
local s = ls.snippet           -- Alias for snippet constructor
local t = ls.text_node         -- Alias for text node constructor
local i = ls.insert_node       -- Alias for insert node constructor



-- Add snippets
ls.add_snippets(nil, {
  all = {
    s("expand", { t("-- this is what was expanded!") }), -- Define a simple snippet
  },
})

