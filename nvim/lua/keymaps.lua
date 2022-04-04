local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Set leader key to Space
keymap("", "<Space>", "<Nop>", opts) -- Remove any Space mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Split movements with alt+arrow
keymap("n", "<A-Up>", ":wincmd k<CR>", opts)
keymap("n", "<A-Down>", ":wincmd j<CR>", opts)
keymap("n", "<A-Left>", ":wincmd h<CR>", opts)
keymap("n", "<A-Right>", ":wincmd l<CR>", opts)
