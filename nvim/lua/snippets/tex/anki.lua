print("✅ anki.lua loaded")

return{
	-- Inline math mode
	s({
		trig = "cc", -- Trigger
		snippetType = "autosnippet", -- Automatically expand
		wordTrig = true, -- Only expand on whole words
	}, {
		t("{{c1::"), -- Text node for opening math
		i(1), -- Placeholder for math content
		t("}}"), -- Text node for closing math
	}),
}

