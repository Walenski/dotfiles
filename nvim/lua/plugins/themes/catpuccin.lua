-- theme, doesnt seem to be compatible with transparent background 

return {"catppuccin/nvim", name = "catppuccin",
        config = function()
            require("catppuccin").setup({
    flavour = "mocha", -- Choose your favorite flavor
})
--             vim.cmd("colorscheme catppuccin") -- Set the colorscheme
        end,
                priority = 1000,
}
