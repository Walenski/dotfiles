
-- set line number and relative number
vim.cmd("set relativenumber")
vim.cmd("set number")

-- set keymap to clear highlighting
vim.keymap.set("n", "<Space>m", ":nohlsearch<CR>m", { noremap = true, silent = true })

-- modify behaviour of tab key
vim.cmd("set tabstop=2")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- approximate typewriter scrolling - not ideal, look for a better solution
vim.o.scrolloff = 999

-- set leader key to space
vim.g.mapleader = " "

vim.o.mouse = 'a'
