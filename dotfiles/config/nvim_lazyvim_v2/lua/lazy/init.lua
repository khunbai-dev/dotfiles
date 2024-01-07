-- =================== lazy.vim - Main config =================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- ============================================================================


local plugins = {
  {import = "plugins"},
  {import = "plugins.lsp"}
}

local options = {
  install = {
    colorscheme = {"onedark"},
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
}

require("lazy").setup(plugins, options)

