-- James Peter 30/12/24
-- main homepage that calls all the plugins, try to put plugins and configuration in their own files to maintain organisation

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("vim-options")
-- require("lazy").setup("plugins")

local function load_plugins()
	local plugins = {}

	-- Recursively find all .lua files in the plugins directory
	local function scan_directory(dir)
		local handle = vim.loop.fs_scandir(dir)
		if not handle then
			return
		end

		while true do
			local name, type = vim.loop.fs_scandir_next(handle)
			if not name then
				break
			end

			local full_path = dir .. "/" .. name
			if type == "directory" then
				scan_directory(full_path) -- Recurse into subdirectories
			elseif name:match("%.lua$") then
				local plugin = dofile(full_path)
				if plugin then
					table.insert(plugins, plugin)
				end
			end
		end
	end

	local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
	scan_directory(plugins_dir)

	return plugins
end

require("lazy").setup(load_plugins())

require("autocommands")


-- this is a test to see if my dotfiles change

-- ~/.config/nvim/init.lua

-- Ensure LuaSnip is installed and required
require("luasnip").setup({})

local luasnip = require("luasnip")

-- LuaSnip configuration
luasnip.setup({
  history = true,             -- Enable snippet history
  updateevents = "TextChanged,TextChangedI", -- Update snippets as you type
  enable_autosnippets = true, -- Enable autosnippets globally
})

local luasnip = require("luasnip")

-- Keybinding to jump forward
vim.keymap.set("i", "fj", function()
  if luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end, { silent = true })

-- Keybinding to jump backward
vim.keymap.set("i", "FJ", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })





-- Load snippets from the 'snippets' directory
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

-- Shortcut to reload all LuaSnip snippet files
vim.keymap.set("n", "<leader><leader>d", function()
	-- Clear existing snippets
	require("luasnip").cleanup()

	-- Reload LuaSnip snippets from the directory
	require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

	print("LuaSnip snippets reloaded!")
end, { desc = "Reload LuaSnip snippets" })

-- vim.cmd[
--   " Expand or jump in insert mode"
--   imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
--   " Jump forward through tabstops in visual mode"
--   smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
--   " Jump backward through snippet tabstops with Shift-Tab (for example)"
--   imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
--   smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
-- ]

-- local cmp = require('cmp')

-- require('luasnip.loaders.from_vscode').lazy_load()
-- luasnip.config.setup {}
--
