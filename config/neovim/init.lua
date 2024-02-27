--  ▄▄▄▄▄▄▄ ▄▄▄     ▄▄   ▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄▄ ▄▄▄ ▄▄▄▄▄▄▄ 
-- █       █   █   █  █ █  █   ▄  █ █       █   █       █
-- █    ▄  █   █   █  █ █  █  █ █ █ █    ▄  █   █   ▄   █
-- █   █▄█ █   █   █  █▄█  █   █▄▄█▄█   █▄█ █   █  █ █  █
-- █    ▄▄▄█   █▄▄▄█       █    ▄▄  █    ▄▄▄█   █  █▄█  █
-- █   █   █       █       █   █  █ █   █   █   █       █
-- █▄▄▄█   █▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄█  █▄█▄▄▄█   █▄▄▄█▄▄▄▄▄▄▄█

-- General

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.cursorline = true

-- Plugins

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

  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "scrooloose/nerdtree",
  "ryanoasis/vim-devicons",
  "mfussenegger/nvim-dap",
  "lewis6991/gitsigns.nvim",
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }},
})

-- CONFIGURATION

vim.cmd.colorscheme "catppuccin-macchiato"
vim.cmd.AirlineTheme "catppuccin"

-- Keybinds
vim.cmd "map <C-s> :w <Enter>" -- Save file
vim.cmd "map <C-q> :wq <Enter>" -- Save and quit file

-- Telescope
vim.cmd "map <C-e> :Telescope find_files <Enter>" -- Search files in dir
vim.cmd "map <C-f> :Telescope live_grep <Enter>" -- Search in file
vim.cmd "map <C-T> :Telescope colorscheme <Enter>" -- Change colorscheme

-- NERDTree BINDS
vim.cmd "map <C-d> :NERDTreeToggle <Enter>"
