return {
    "L3MON4D3/LuaSnip", -- LuaSnip plugin
    version = "1.*",    -- Optional: Pin to a stable version
    config = function()
        require("luasnip").setup({
            history = true, -- Allows navigating back and forth in snippet placeholders
            updateevents = "TextChanged,TextChangedI", -- Auto-updates snippets as you type
        })
    end,
}





-- return {
-- 	"L3MON4D3/LuaSnip",
-- 	-- follow latest release.
-- 	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
-- 	-- install jsregexp (optional!).
-- 	build = "make install_jsregexp"
-- }
