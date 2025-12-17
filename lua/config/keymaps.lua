-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
--   https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Half-page scroll while keeping cursor centered (like <C-d>zz / <C-u>zz)
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center" })

-- Search and Replace in Visual Selection
-- Press <leader>r while text is selected
map("x", "<leader>r", ":s/\\%V//gI<Left><Left><Left><Left>", { desc = "Replace in Selection" })
map("n", "<tab>", ":bnext<CR>")
map("n", "<s-tab>", ":bprev<CR>")
