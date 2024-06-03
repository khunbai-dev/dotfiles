return {
  'smoka7/hop.nvim',
  version = "*",
  opts = { keys = 'etovxqpdygfblzhckisuran' },
  config = function ()
    local hop = require('hop')
    hop.setup({
      extend_visual = true
    })
  end
}