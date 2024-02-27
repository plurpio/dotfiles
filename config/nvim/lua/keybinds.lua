--------------
-- Keybinds --
--------------
vim.keymap.set("n", "<C-s>", "<cmd>w <CR>") -- Save file
vim.keymap.set("n", "<C-q>", "<cmd>wq <CR>") -- Save and quit file

-- Editor Movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Telescope
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep <CR>") -- Search in file
vim.keymap.set("n", "<C-t>", "<cmd>Telescope colorscheme <CR>") -- Change colorscheme

-- Harpoon
vim.cmd "map <C-y> :lua require('harpoon.mark').add_file() <Enter>" -- Add file to harpoon
vim.cmd "map <C-g> :lua require('harpoon.mark').rm_file() <Enter>" -- Add remove to harpoon
vim.keymap.set("n", "<C-e>", "<cmd>Telescope harpoon marks <CR>") -- Opens marked files changer thing

-- NvimTree
vim.keymap.set("n", "<C-d>", "<cmd>NvimTreeToggle<CR>") -- Opens dir tree
vim.keymap.set("n", "<S-d>", "<cmd>NvimTreeFocus<CR>") -- Focuses dir tree
