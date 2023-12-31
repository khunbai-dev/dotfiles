local plugins = {
  {'phaazon/hop.nvim', branch='v2'},

  -- Themes
  -- Switch between gruvbox and onedark at /plugin/config/colorscheme.lua
  'gruvbox-community/gruvbox',
  'navarasu/onedark.nvim',

  -- lualine, status bar below
  {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  },

  -- nvim-tree, file explorer
  {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  },

  -- specs.nvim, cursor moving effect
  {'edluffy/specs.nvim'},

  -- bufferline, tab page integration
  {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons'
  },

  -- treesitter, text highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  },

  -- Additional text objects via treesitter
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },

    -- LSP, LSP server management
  {
    "neovim/nvim-lspconfig",  -- Enable LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvim-lua/plenary.nvim",  -- required by null-ls
    "jose-elias-alvarez/null-ls.nvim"  -- for formatters and linters
  },

  -- Cmp, Auto complete things
  {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",       -- buffer completions
    "hrsh7th/cmp-path",         -- path completions
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",         -- The completion plugin
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip"  -- snippet completions
  },

  -- Snippets, snippet to use with auto complete
  { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }, --snippet engine
  { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use
}

local options = {}

-- Plugin to be installed
require("lazy").setup(plugins, options)


-- Load plugin config module
require('plugin.config.hop')
require('plugin.config.colorscheme')
require('plugin.config.lualine')
require('plugin.config.nvim-tree')
require('plugin.config.specs-nvim')
require('plugin.config.bufferline')
require('plugin.config.treesitter')
require('plugin.config.nvim-cmp')
require('plugin.config.lsp')
