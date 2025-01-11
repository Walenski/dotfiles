return {
    -- nvim-cmp plugins
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
  config = function()
    -- Import nvim-cmp and configure
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        -- Required for `luasnip`
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
        ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Scroll documentation down
        ["<C-m>"] = cmp.mapping.complete(),  -- Trigger completion
        ["<C-e>"] = cmp.mapping.abort(),         -- Abort completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm completion
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completion
        { name = "luasnip" },  -- Snippet completion
    }, {
        { name = "buffer" },   -- Buffer completion
        { name = "path" },     -- Path completion
    }),
})

-- Configure LSP capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable the LSP client with enhanced completion
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    capabilities = capabilities,
})
  end
}

 









-- return {
--   { 
--     'hrsh7th/nvim-cmp',
--     dependencies = { 
--       'L3MON4D3/LuaSnip',
--       'saadparwaiz1/cmp_luasnip',
--       -- 'rafarmadriz/friendly-snippets',
--       'hrsh7th/cmp-nvim-lsp',
--
--     },
--   },
-- }


