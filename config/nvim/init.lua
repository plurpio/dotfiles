-------------
-- General --
-------------

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

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
-- THEMES
  "catppuccin/nvim",
  "Mofiqul/vscode.nvim",
  "shaunsingh/nord.nvim",
  "navarasu/onedark.nvim",

-- LSP & CODE EDITING
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},

  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},

-- OTHER
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "nvim-tree/nvim-tree.lua",
  "theprimeagen/harpoon",
  "ryanoasis/vim-devicons",
  "lewis6991/gitsigns.nvim",
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }},
})

--------------------------
-- Plugin Configuration --
--------------------------
require('gitsigns').setup()
require("telescope").load_extension('harpoon')
require("nvim-tree").setup()

-- LSP & CODE EDITING
-- LSP Packages: pyright, lua-language-server
require("mason").setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local lsp_zero = require('lsp-zero')
require('lspconfig').pyright.setup({})
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.marksman.setup{}

-------------------
-- CONFIGURATION --
-------------------
vim.cmd.colorscheme "catppuccin-macchiato"
vim.cmd.AirlineTheme "catppuccin"

--------------
-- Keybinds --
--------------
vim.keymap.set("n", "<C-s>", "<cmd>w <CR>") -- Save file
vim.keymap.set("n", "<C-q>", "<cmd>wq <CR>") -- Save and quit file

-- Telescope
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep <CR>") -- Search in file
vim.keymap.set("n", "<C-t>", "<cmd>Telescope colorscheme <CR>") -- Change colorscheme

-- Harpoon
vim.cmd "map <C-y> :lua require('harpoon.mark').add_file() <Enter>" -- Add file to harpoon
vim.cmd "map <C-g> :lua require('harpoon.mark').rm_file() <Enter>" -- Add remove to harpoon
vim.keymap.set("n", "<C-e>", "<cmd>Telescope harpoon marks <CR>") -- Opens marked files changer thing

-- NERDTree BINDS
vim.keymap.set("n", "<C-d>", "<cmd>NvimTreeToggle<CR>") -- Opens dir tree


-- CMP Binds
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+a to trigger completion menu
    ['<C-a>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-v>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-x>'] = cmp.mapping.scroll_docs(-4),
    ['<C-z>'] = cmp.mapping.scroll_docs(4),
  })
})
