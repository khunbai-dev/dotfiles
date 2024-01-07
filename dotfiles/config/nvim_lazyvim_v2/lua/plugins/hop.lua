return {
  'phaazon/hop.nvim',
  config = function ()
    local hop = require('hop')
    hop.setup({
      extend_visual = true
    })
  end
}
