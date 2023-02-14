require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup {
  ensure_installed = { 
    -- Available LSP server list see here
    -- https://github.com/williamboman/mason-lspconfig.nvim
    "pyright",
    "jsonls",
    "html",
    "cssls",
    "tsserver",
    "angularls"
  },
}