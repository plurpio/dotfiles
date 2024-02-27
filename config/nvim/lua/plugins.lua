---------------
--- Plugins ---
---------------

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

require("lazy").setup({

------------
-- THEMES --
------------

  {
	  "catppuccin/nvim"
  },

  {
	  "Mofiqul/vscode.nvim"
  },

  {
	  "shaunsingh/nord.nvim"
  },

  {
    "ellisonleao/gruvbox.nvim"
  },

  {
    "folke/tokyonight.nvim"
  },

  {
    "dylanaraps/wal.vim"
  },

------------
-- EDITOR --
------------

  {
    'nvimdev/dashboard-nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  {
	  "nvim-tree/nvim-tree.lua",
	  dependencies = { "ryanoasis/vim-devicons" }
  },

  {
	  "nvim-telescope/telescope.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" }
  },

  {
    "folke/zen-mode.nvim",
    opts = {
      width = 50,
      height = 1,
      backdrop = 0.7,
      }
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
    }
  },

------------------------
-- LSP & CODE EDITING --
------------------------
  {
	  'williamboman/mason.nvim'
  },

  {
	  'williamboman/mason-lspconfig.nvim'
  },

  {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x'
  },

  {
	  'neovim/nvim-lspconfig'
  },

  {
	  'hrsh7th/cmp-nvim-lsp'
  },

  {
	  'hrsh7th/nvim-cmp'
  },

  {
    'stevearc/conform.nvim',
    opts = {},
  },

  {
	  'L3MON4D3/LuaSnip'
  },

  {
    'rafamadriz/friendly-snippets'
  },

  {
	  "theprimeagen/harpoon"
  },

  {
	  "lewis6991/gitsigns.nvim",
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true
  }
})

