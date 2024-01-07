return {
  'navarasu/onedark.nvim',
  priority = 1000, -- make sure to load this before all other start plugins
  config = function()
    require('onedark').setup {
      style = 'warm',
      transparent = false,  -- Show/hide background
      colors = {
        grey = '#494949',  -- Override comment color to get a little bit darker
      },
    }
    require('onedark').load()
  end,
}
