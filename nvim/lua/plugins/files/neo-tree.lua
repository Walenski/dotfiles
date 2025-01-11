-- shows a file tree that can be navigated through, standard vim keybinds to cut, copy, paste etc. ensure that when pasting files cursor is on the directory, not its contents 

return {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
    "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set('n', '<leader>n', ':Neotree filesystem toggle left <CR>')
    end 
}
