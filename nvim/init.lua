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


