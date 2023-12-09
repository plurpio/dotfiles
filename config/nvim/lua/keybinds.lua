--------------
-- Keybinds --
--------------

vim.g.mapleader = ' '

vim.keymap.set("n", "ew", "<cmd>w <CR>") -- Save file
vim.keymap.set("n", "eq", "<cmd>wq <CR>") -- Save and quit file
vim.cmd "map ec :lua require('conform').format() <Enter>"

-- Git
vim.keymap.set("n", "eg", "<cmd>Neogit <CR>") -- Opens NeoGit
vim.keymap.set("n", "ef", "<cmd>Telescope git_files <CR>") -- Searchs files in git repos

-- Editor Movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigation
vim.cmd "map et :lua require('harpoon.mark').add_file() <Enter>" -- Add file to harpoon
vim.cmd "map er :lua require('harpoon.mark').rm_file() <Enter>" -- Add remove to harpoon
vim.keymap.set("n", "ex", "<cmd>Dashboard <CR>") -- Access dashboard
vim.keymap.set("n", "ee", "<cmd>Telescope harpoon marks <CR>") -- Opens marked files changer thing

vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep <CR>") -- Search in file
vim.keymap.set("n", "<C-t>", "<cmd>Telescope colorscheme <CR>") -- Change colorscheme

-- NvimTree
vim.keymap.set("n", "<C-d>", "<cmd>NvimTreeToggle<CR>") -- Opens dir tree
vim.keymap.set("n", "<S-d>", "<cmd>NvimTreeFocus<CR>") -- Focuses dir tree

-- Learning Binds
vim.keymap.set("n", "<up>", "")
vim.keymap.set("n", "<down>", "")
vim.keymap.set("n", "<right>", "")
vim.keymap.set("n", "<left>", "")
