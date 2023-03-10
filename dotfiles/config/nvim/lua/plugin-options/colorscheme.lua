-- Set colorscheme, pick only one

-- == gruvbox =================================================================
-- vim.cmd[[colorscheme gruvbox]]
-- ============================================================================

-- == onedark =================================================================
-- vim.cmd [[colorscheme onedark]]
require('onedark').setup {
  style = 'warm',
  transparent = false,  -- Show/hide background
  colors = {
    grey = '#494949',  -- Override comment color to get a little bit darker
  },
}
require('onedark').load()
-- ============================================================================
