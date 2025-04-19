return {
  "L3MON4D3/LuaSnip",
  priority = 1000,
  lazy = false,
  config = function()
    local luasnip = require("luasnip")

    -- Setup LuaSnip
    luasnip.setup({
      enable_autosnippets = true,
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    -- Load snippets from the 'snippets' directory
    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets",
    })

-- note to self - if this is set too low then the built in gcc to comment text command will stop working - why???
vim.opt.timeoutlen = 300


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

    -- Reload all LuaSnip snippet files
    vim.keymap.set("n", "<leader><leader>d", function()
      luasnip.cleanup()

      for module_name, _ in pairs(package.loaded) do
        if module_name:match("^snippets") then
          package.loaded[module_name] = nil
        end
      end

      require("luasnip.loaders.from_lua").load({
        paths = vim.fn.stdpath("config") .. "/lua/snippets",
      })

      print("🔁 LuaSnip snippets reloaded.")
    end, { desc = "Reload LuaSnip snippets" })
  end,
}


-- -- below definitely works 
-- return {
-- 	"L3MON4D3/LuaSnip",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		local ls = require("luasnip")
-- 		ls.setup({
-- 			history = true,
-- 			updateevents = "TextChanged,TextChangedI",
-- 			enable_autosnippets = true,
-- 			load_ft_func = function()
-- 				return {}
-- 			end,
-- 		})
--
-- 		-- We use `.load()` because each snippet file returns a flat list
-- 		require("luasnip.loaders.from_lua").load({
-- 			paths = vim.fn.expand("~/.config/nvim/lua/snippets"),
-- 		})
-- 	end,
-- }
--
-- return {
--   "L3MON4D3/LuaSnip",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     local ls = require("luasnip")
--     local s = ls.snippet
--     local t = ls.text_node
--
--     ls.setup({
--       history = true,
--       updateevents = "TextChanged,TextChangedI",
--       enable_autosnippets = true,
--     })
--
--     require("luasnip.loaders.from_lua").load({
--       paths = vim.fn.stdpath("config") .. "/lua/snippets"
--     })
--
--     vim.keymap.set("i", "<C-j>", function()
--       if ls.jumpable(1) then ls.jump(1) end
--     end)
--
--     vim.keymap.set("n", "<leader><leader>d", function()
--       ls.cleanup()
--       for name in pairs(package.loaded) do
--         if name:match("^snippets") then package.loaded[name] = nil end
--       end
--       require("luasnip.loaders.from_lua").load({
--         paths = vim.fn.stdpath("config") .. "/lua/snippets"
--       })
--       print("🔁 Snippets reloaded")
--     end)
--   end
-- }
--
--

-- return {
--   "L3MON4D3/LuaSnip",
--   priority = 1000,
--   lazy = false,
--   config = function()
--     local luasnip = require("luasnip")
--
--     -- Setup LuaSnip
--     luasnip.setup({
--       enable_autosnippets = true,
--       history = true,
--       updateevents = "TextChanged,TextChangedI",
--     })
--
--     -- Load snippets from the 'snippets' directory
--     require("luasnip.loaders.from_lua").lazy_load({
--       paths = vim.fn.stdpath("config") .. "/lua/snippets",
--     })
--
--     -- Keybinding to jump forward
--     vim.keymap.set("i", "fj", function()
--       if luasnip.jumpable(1) then
--         luasnip.jump(1)
--       end
--     end, { silent = true })
--
--     -- Keybinding to jump backward
--     vim.keymap.set("i", "FJ", function()
--       if luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       end
--     end, { silent = true })
--
--     -- Reload all LuaSnip snippet files
--     vim.keymap.set("n", "<leader><leader>d", function()
--       luasnip.cleanup()
--
--       for module_name, _ in pairs(package.loaded) do
--         if module_name:match("^snippets") then
--           package.loaded[module_name] = nil
--         end
--       end
--
--       require("luasnip.loaders.from_lua").load({
--         paths = vim.fn.stdpath("config") .. "/lua/snippets",
--       })
--
--       print("🔁 LuaSnip snippets reloaded.")
--     end, { desc = "Reload LuaSnip snippets" })
--   end,
-- }
--
--
--
--

-- return {
-- 	"L3MON4D3/LuaSnip",
-- 	priority = 1000,
-- 	lazy = false,
-- 	config = function()
-- 		local luasnip = require("luasnip")
--
-- 		-- Setup LuaSnip with configuration options
-- 		luasnip.setup({
-- 			enable_autosnippets = true, -- Enable automatic snippet expansion
-- 			history = true, -- Enable snippet history
-- 			updateevents = "TextChanged,TextChangedI", -- Update snippets as you type
-- 		})
--
-- 		-- Keybinding to jump forward
-- 		vim.keymap.set("i", "fj", function()
-- 			if luasnip.jumpable(1) then
-- 				luasnip.jump(1)
-- 			end
-- 		end, { silent = true })
--
-- 		-- Keybinding to jump backward
-- 		vim.keymap.set("i", "FJ", function()
-- 			if luasnip.jumpable(-1) then
-- 				luasnip.jump(-1)
-- 			end
-- 		end, { silent = true })
-- 	end,
--
--
-- -- Ensure LuaSnip is installed and required
-- require("luasnip").setup({})
--
-- local luasnip = require("luasnip")
--
-- -- LuaSnip configuration
-- luasnip.setup({
-- 	history = true, -- Enable snippet history
-- 	updateevents = "TextChanged,TextChangedI", -- Update snippets as you type
-- 	enable_autosnippets = true, -- Enable autosnippets globally
-- })
--
-- -- Keybinding to jump forward
-- vim.keymap.set("i", "fj", function()
-- 	if luasnip.jumpable(1) then
-- 		luasnip.jump(1)
-- 	end
-- end, { silent = true })
--
-- -- Keybinding to jump backward
-- vim.keymap.set("i", "FJ", function()
-- 	if luasnip.jumpable(-1) then
-- 		luasnip.jump(-1)
-- 	end
-- end, { silent = true })
--
-- -- Load snippets from the 'snippets' directory
-- require("luasnip.loaders.from_lua").load({
-- 	paths = vim.fn.stdpath("config") .. "/lua/snippets",
-- })
--
-- -- Shortcut to reload all LuaSnip snippet files
-- vim.keymap.set("n", "<leader><leader>d", function()
-- 	-- 1. Clear existing snippets
-- 	require("luasnip").cleanup()
--
-- 	-- 2. Unload all custom snippet modules
-- 	for module_name, _ in pairs(package.loaded) do
-- 		if module_name:match("^snippets") then
-- 			package.loaded[module_name] = nil
-- 		end
-- 	end
--
-- 	-- 3. Reload from_lua
-- 	require("luasnip.loaders.from_lua").load({
-- 		paths = vim.fn.stdpath("config") .. "/lua/snippets",
-- 	})
--
-- 	print("🔁 LuaSnip snippets reloaded.")
-- end, { desc = "Reload LuaSnip snippets" })
--
--
--
-- }
--
-- return {
--     "L3MON4D3/LuaSnip", -- Plugin name
--     -- lazy = false, -- Lazy-load LuaSnip
--     -- dependencies = {
--     --     "rafamadriz/friendly-snippets", -- Optional snippets collection
--     -- },
--     config = function()
--         require('snippets.firstsnippets')
--       -- require("luasnip.loaders.from_vscode").load({paths = "~/.config/nvim/lua/plugins/snippets/"})
--         local luasnip = require("luasnip")
--         -- luasnip.snipppets = require("snippets1")
--
--         -- Set LuaSnip options
--         luasnip.config.set_config({
--             history = true, -- Enable snippet history
--             updateevents = "TextChanged,TextChangedI", -- Update snippets on these events
--         })
--
--         -- Load VSCode-style snippets
--         require("luasnip.loaders.from_vscode").lazy_load()
--
--         -- -- Load custom snippets from a directory
--         --  require("luasnip.loaders.from_lua").lazy_load({
--         --      paths = "~/.config/nvim/lua/plugins/snippets/",
--         -- })
--
--         -- Optionally print a debug message to confirm loading
--         -- print("LuaSnip and snippets loaded!")
--     -- local ls = require("luasnip") -- Require LuaSnip
--
--
--
--
--     --loads vscode style snippets from installed plugins (e.g. friendly-snippets)
-- 		require("luasnip.loaders.from_vscode").lazy_load()
--
-- 		luasnip.config.set_config({
-- 			-- Tells LuaSnip to remember to keep around the last snippet.
-- 			-- Can jump back into the snippet even if you move outside of the selection
-- 			history = true,
--
-- 			-- If you have dynamic snippets, this updates as you type!
-- 			updateevents = "TextChanged,TextChangedI",
--
-- 			-- Autosnippets:
-- 			enable_autosnippets = true,
-- 		})
--
--
-- 		-- <c-k> is the expansion key here
-- 		-- this will expand the current item or jump to the next item within the snippet.
--
-- 		vim.keymap.set({ "i", "s" }, "<C-k>", function()
-- 			if luasnip.expand_or_jumpable() then
-- 				luasnip.expand_or_jump()
-- 			end
-- 		end, { silent = true })
--
-- 		-- <c-j> is the jump backwards key here
-- 		-- it always moves to the previous item within the snippet
-- 		vim.keymap.set({ "i", "s" }, "<c-j>", function()
-- 			if luasnip.jumpable(-1) then
-- 				luasnip.jump(-1)
-- 			end
-- 		end, { silent = true })
--
-- -- <c-l> is selecting within a list of options.
-- -- This is useful for choice nodes
--   vim.keymap.set("i", "<c-l>", function()
--       if luasnip.choice_active() then
--         luasnip.change_choice(1)
--       end
--     end)
--
--
--     end,
--
--
-- }
