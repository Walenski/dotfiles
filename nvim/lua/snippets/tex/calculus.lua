print("✅ calculus.lua loaded")

-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts.


return {
-- Another take on the fraction snippet without using a regex trigger
s({trig = "ff"},
  fmta(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),




	-- full derivative
	s({ trig = "dd", snippetType = "autosnippet", wordTrig = true }, {
		t("\\frac{\\mathrm{d}}{\\mathrm{d}"),
		i(1), -- Placeholder for the cloze content
		t("}"),
	}),

	-- single integral with limits

	s({ trig = "lin", snippetType = "autosnippet", wordTrig = true }, {
		t("\\int_{"),
		i(2, "lower"), -- Lower limit (default placeholder text: "lower")
		t("}^{"),
		i(3, "upper"), -- Upper limit (default placeholder text: "upper")
		t("} "),
		i(1, "integrand"), -- Integrand (default placeholder text: "integrand")
		t(" \\, \\mathrm{d}"),
		i(4, "x"), -- Variable of integration (default placeholder text: "x")
	}),
    {condition = in_mathzone},
}



--{
  --  condition = utils.in_math_mode 
--  }
