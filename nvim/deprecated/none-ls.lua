return {
    {
        "nvimtools/none-ls.nvim",
        local null_ls = require("null-ls")
        null_ls.setup({
        sources = {
           null_ls.builtins.formatting.stylua,
           null_ls.builtins.completion.spell,
           require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    },
})
            },
}

-- vim.keymap.set("n", "<leader>fg", vim.lsp.buf.format, {})
