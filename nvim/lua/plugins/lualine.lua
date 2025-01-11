-- generates useful status bar with icons at the bottom of the screen, can be customised 

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({options = {
      theme = 'nightfly'}
    })
  end
}
