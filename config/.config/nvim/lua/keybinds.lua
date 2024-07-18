--------------
-- Keybinds --
--------------

vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>w", "<cmd>w <CR>") -- Save file
vim.keymap.set("n", "<leader>q", "<cmd>wq <CR>") -- Save and quit file
vim.cmd "map <leader>c :lua require('conform').format() <Enter>"

-- Git
vim.keymap.set("n", "<leader>g", "<cmd>Neogit <CR>") -- Opens NeoGit
vim.keymap.set("n", "<leader>f", "<cmd>Telescope git_files <CR>") -- Searchs files in git repos

-- Editor Movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigation
vim.cmd "map et :lua require('harpoon.mark').add_file() <Enter>" -- Add file to harpoon
vim.cmd "map er :lua require('harpoon.mark').rm_file() <Enter>" -- Add remove to harpoon
vim.keymap.set("n", "<leader>x", "<cmd>Dashboard <CR>") -- Access dashboard
vim.keymap.set("n", "<leader>e", "<cmd>Telescope harpoon marks <CR>") -- Opens marked files changer thing
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set("n", "<leader>F", "<cmd>Telescope live_grep <CR>") -- Search in file
vim.keymap.set("n", "<leader>t", "<cmd>Telescope colorscheme <CR>") -- Change colorscheme

-- NvimTree
vim.keymap.set("n", "<leader>d", "<cmd>Oil<CR>") -- Opens dir tree

vim.keymap.set("v", "p", "pgvy") --  Gets back clipboard after pasting

-- Learning Binds
vim.keymap.set("n", "<up>", "")
vim.keymap.set("n", "<down>", "")
vim.keymap.set("n", "<right>", "")
vim.keymap.set("n", "<left>", "")
