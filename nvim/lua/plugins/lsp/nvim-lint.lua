return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			LaTeX = { "vale" },
			lua = { "luacheck" },
		}

		-- Create a linting augroup
		local lint_augroup = vim.api.nvim_create_augroup("LintGroup", { clear = true })

		-- Autocommands for linting on specific events
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if _G.lint_enabled then -- Check if linting is enabled
					lint.try_lint()
				end
			end,
		})
		-- Keymap to trigger linting manually
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })

		-- Keymap to toggle linting
		_G.lint_enabled = true
		vim.keymap.set("n", "<leader>lt", function()
			_G.lint_enabled = not _G.lint_enabled
			if _G.lint_enabled then
				print("Linting enabled")
			else
				vim.diagnostic.reset(nil, 0) -- Clear diagnostics
				print("Linting disabled")
			end
		end, { noremap = true, silent = true, desc = "Toggle linting" })
	end,
}
















-- return {
--   "mfussenegger/nvim-lint",
--   event = {
--     "BufReadPre",
--     "BufNewFile",
--   },
--   config = function()
--     local lint = require("lint")
--     lint.linters_by_ft = {
--       LaTeX = { "vale" },
--       lua = { "luacheck" },
--     }
--   local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
--
--   vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
--       group = lint_augroup,
--       callback = function()
--         lint.try_lint()
--       end,
--     })
--   vim.keymap.set("n", "<leader>ll", function()
--     lint.try_lint()
--     end, { desc = "Trigger linting for current file" })
--   end,
-- }
