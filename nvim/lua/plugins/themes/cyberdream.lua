-- futuristic theme, works well with transparent backgrounds (set these in the terminal configuration)

return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = true,
			italic_comments = true,
			terminal_colours = true,
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
