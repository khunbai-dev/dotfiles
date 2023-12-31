vim.opt.termguicolors = true

require("bufferline").setup{
  options = {
    mode = "buffers",
    separator_style = "slant",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
  }
}

