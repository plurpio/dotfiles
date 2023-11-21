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
	  "navarasu/onedark.nvim"
  },

  {
    "ellisonleao/gruvbox.nvim"
  },

  {
    "folke/tokyonight.nvim"
  },

------------
-- EDITOR --
------------

  {
    'nvimdev/dashboard-nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  {
	  "vim-airline/vim-airline"
  },

  {
	  "vim-airline/vim-airline-themes"
  },

  {
	  "nvim-tree/nvim-tree.lua"
  },

  {
	  "ryanoasis/vim-devicons"
  },

  {
	  "nvim-telescope/telescope.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" }
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
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
	  "lewis6991/gitsigns.nvim"
  }
})

