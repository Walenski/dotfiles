-- enables the lsp servers (i.e. the things the editor talks to) to be configured directly within neovim, saves having to manually install them 


return {
  {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "texlab"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
     config = function()
       local lspconfig = require("lspconfig")
       lspconfig.lua_ls.setup({})
       lspconfig.texlab.setup({})
       vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
       vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, {})
    end
  }
}
