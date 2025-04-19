-- local ls = require("luasnip") -- Import LuaSnip
-- local s = ls.snippet -- Alias for snippet constructor
-- local t = ls.text_node -- Alias for text node constructor
-- local i = ls.insert_node -- Alias for insert node constructor

print("✅ math.lua loaded")
return {

	-- Inline math mode
	s({
		trig = "dk", -- Trigger
		snippetType = "autosnippet", -- Automatically expand
		wordTrig = true, -- Only expand on whole words
	}, {
		t("\\("), -- Text node for opening math
		i(1), -- Placeholder for math content
		t("\\)"), -- Text node for closing math
	}),

s({
  trig = "ls", -- Trigger
  snippetType = "autosnippet", -- Automatically expand
  wordTrig = true, -- Only expand on whole words
}, {
  t("\\[ "), -- Opening \[ with space
  i(1), -- Placeholder for content
  t(" \\]"), -- Closing \] with space
}),


-- math roman environment 
s(
    { trig = "rm", snippetType = "autosnippet", wordTrig = true },
    {
      t("\\mathrm{"),
      i(1), -- Placeholder for the cloze content
      t("}"),
    }
  ),

--
-- -- manual fraction snippet 
-- s({ trig = "ff", snippetType = "autosnippet", wordTrig = false }, {
--   t { "\\frac{" },
--   i(1),
--   t { "}{" },
--   i(2),
--   t { "}" },
-- }),
--

-- -- fraction snippet  
--   s(
--     { trig = "([%w\\]+)%/", regTrig = true, snippetType = "autosnippet" },
--     {
--       t("\\frac{"),
--       f(function(_, snip)
--         return snip.captures[1] -- Insert the captured text before the `/`
--       end),
--       t("}{"),
--       i(1), -- Place the cursor in the second braces
--       t("}"),
--     },
--     {
--       condition = in_math_mode, -- Only expand in math mode
--     }
--   ),
--



	-- Snippet for subscript triggered by "al"
	s({ trig = "_", snippetType = "autosnippet", wordTrig = false, regTrig = false }, {
		t("_{"),
		i(1),
		t("}"),
	}, {
		condition = in_math_mode, -- Math mode condition using Tree-sitter
	}),

	-- Superscript snippet triggered by "^"
	s({ trig = "%^", snippetType = "autosnippet", wordTrig = false, regTrig = true }, {
		t("^{"),
		i(1),
		t("}"),
	}, {
		condition = in_math_mode, -- Math mode condition using Tree-sitter
	}),

  -- shorthand for infinity
	s({ trig = "inf", snippetType = "autosnippet", wordTrig = true }, {
		t("\\infty"),
	}, {
		condition = in_math_mode, -- Only expand in math mode
	}),

	-- math blackboard mode

	s({ trig = "bb", snippetType = "autosnippet", wordTrig = true }, {
		t("\\mathbb{"),
		i(1),
		t("}"),
	}, {
		condition = in_math_mode, -- Only trigger in math mode
	}),

}

