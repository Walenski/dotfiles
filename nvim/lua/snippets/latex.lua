local ls = require("luasnip") -- Import LuaSnip
local s = ls.snippet -- Alias for snippet constructor
local t = ls.text_node -- Alias for text node constructor
local i = ls.insert_node -- Alias for insert node constructor

-- Minimal test autosnippets
ls.add_snippets("tex", {
	-- Inline math mode
	ls.snippet({
		trig = "mk", -- Trigger
		snippetType = "autosnippet", -- Automatically expand
		wordTrig = true, -- Only expand on whole words
	}, {
		t("\\("), -- Text node for opening math
		i(1), -- Placeholder for math content
		t("\\)"), -- Text node for closing math
	}),

	-- Display math mode
	ls.snippet({
		trig = "dm", -- Trigger
		snippetType = "autosnippet", -- Automatically expand
		wordTrig = true, -- Only expand on whole words
	}, {
		t({ "\\[", "  " }),
		i(1),
		t({ "", "\\]" }),
	}),

	-- Add a fraction snippet
	ls.add_snippets("tex", {
		s({
			trig = "frac", -- Trigger for the snippet
			snippetType = "autosnippet", -- Automatically expand
			wordTrig = true, -- Only trigger on whole words
		}, {
			t("\\frac{"), -- Text for the numerator part
			i(1, "numerator"), -- Placeholder for the numerator
			t("}{"), -- Divider between numerator and denominator
			i(2, "denominator"), -- Placeholder for the denominator
			t("}"), -- Closing brace
		}),
	}),
})

-- local ls = require("luasnip") -- Import LuaSnip
-- local s = ls.snippet           -- Alias for snippet constructor
-- local t = ls.text_node         -- Alias for text node constructor
-- local i = ls.insert_node       -- Alias for insert node constructor
-- local f = ls.function_node     -- Alias for function node constructor
--
-- -- Define LaTeX-specific snippets
-- ls.add_snippets("tex", { -- "tex" is the filetype for LaTeX in Neovim
--   -- Snippet for a LaTeX document template
--   s("doc", {
--     t({ "\\documentclass{article}", "", "\\begin{document}", "" }),
--     i(1, "Your content here"), -- Insert node for user content
--     t({ "", "\\end{document}" }),
--   }),
--
--   -- Snippet for a LaTeX section
--   s("sec", {
--     t("\\section{"), i(1, "Section Title"), t("}"), -- Section title
--     t({ "", "" }), i(0), -- Insert node for content
--   }),
--
--   -- Snippet for inline math
--   s("imath", {
--     t("\\("), i(1, "math"), t("\\)"), -- Inline math environment
--   }),
--
--   -- Snippet for a figure environment
--   s("fig", {
--     t({ "\\begin{figure}[h!]", "\t\\centering", "\t\\includegraphics[width=" }),
--     i(1, "0.8\\textwidth"), -- Insert node for width
--     t("]{"), i(2, "path/to/image"), t("}"), -- Insert node for image path
--     t({ "", "\t\\caption{" }), i(3, "Caption"), t("}"),
--     t({ "", "\t\\label{" }), i(4, "fig:label"), t("}"),
--     t({ "", "\\end{figure}" }),
--   }),
-- })
--
--
--
