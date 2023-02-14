--==============================================================================
-- Install your plugin here.
--==============================================================================

return require('packer').startup(function()
  -- packer can manage itself (Package manager)
  use 'wbthomason/packer.nvim'


  -- LSP, LSP server management
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Cmp, Auto complete things
  use {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",       -- buffer completions
    "hrsh7th/cmp-path",         -- path completions
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",         -- The completion plugin
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip"  -- snippet completions
  }

  -- Snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
  -- use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- colorscheme
  use 'gruvbox-community/gruvbox'

  -- airline
  --use 'vim-airline/vim-airline'
  --use 'vim-airline/vim-airline-themes'
  
  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  -- hop
  use {'phaazon/hop.nvim', branch = 'v2'}

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- spec.nvim, cursor moving effect
  use {'edluffy/specs.nvim'}


end)
