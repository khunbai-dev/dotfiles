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

  -- Snippets, snippet to use with auto complete
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- colorscheme, switch theme in `lua/plugin-options/color-theme.lua`
  use 'gruvbox-community/gruvbox'
  use 'navarasu/onedark.nvim' -- Theme inspired by Atom

  -- airline
  --use 'vim-airline/vim-airline'
  --use 'vim-airline/vim-airline-themes'
  
  -- lualine, status bar below
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  -- hop, jump to any where faster
  use {'phaazon/hop.nvim', branch = 'v2'}

  -- nvim-tree, file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Additional text objects via treesitter
  use { 
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- bufferline, tab page integration
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- spec.nvim, cursor moving effect
  use {'edluffy/specs.nvim'}

  -- treesitter, text highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }


  -- vim-obsession, session save
  use 'tpope/vim-obsession'


end)
