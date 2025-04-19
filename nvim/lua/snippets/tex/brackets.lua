print("✅ brackets.lua loaded")
return {

	-- parentheses, autoscaling
	s({ trig = "lr%(", snippetType = "autosnippet", wordTrig = false, regTrig = true }, {
		t("\\left( "),
		i(1),
		t(" \\right)"),
	}, {
		condition = in_math_mode, -- Only trigger in math mode
	}),

	-- curly brackets, autoscaling

	s({ trig = "lr%{", snippetType = "autosnippet", wordTrig = false, regTrig = true }, {
		t("\\left\\{ "),
		i(1),
		t(" \\right\\}"),
	}, {
		condition = in_math_mode, -- Only trigger in math mode
	}),
 
	-- square brackets, autoscaling
	s({ trig = "lr%[", snippetType = "autosnippet", wordTrig = false, regTrig = true }, {
		t("\\left[ "),
		i(1),
		t(" \\right]"),
	}, {
		condition = in_math_mode, -- Only trigger in math mode
	}),
}
