--Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })


-- highlight yanks 
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "custom_buffer",
  pattern = "*",
  callback = function() vim.highlight.on_yank {timeout = 200} end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { -- Use a table for multiple events
  pattern = "*.tex",
  command = "set filetype=tex",
})


vim.keymap.set("n", "<leader>s", ":SendToAnki<CR>", { noremap = true, silent = true })

