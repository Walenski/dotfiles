print("✅ linear_algebra.lua loaded")
return {

	-- hat snippet
	s({ trig = "hat", snippetType = "autosnippet", wordTrig = true }, {
		t("\\hat{"),
		i(1), -- Placeholder for the cloze content
		t("}"),
	}, {
		condition = in_math_mode, -- Only trigger in math mode
	}),

	-- vector snippet
	s({ trig = "vec", snippetType = "autosnippet", wordTrig = true }, {
		t("\\vec{"),
		i(1), -- Placeholder for the cloze content
		t("}"),
	}, {
		condition = in_math_mode, -- Only trigger in math mode
	}),
}
