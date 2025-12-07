-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
--   https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- make jj as escape
map("i", "jj", "<Esc>")

-- Search and Replace in Visual Selection
-- Press <leader>r while text is selected
map("x", "<leader>r", ":s/\\%V//gI<Left><Left><Left><Left>", { desc = "Replace in Selection" })

-- Delete a word around
map("n", "dw", "daw")

-- Select all
map("n", "<C-a>", "gg2vG$")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable comment line continuations
map("n", "<Leader>o", "o<Esc>^Da", opts)
map("n", "<Leader>O", "O<Esc>^Da", opts)

-- use tab to switching buffers
map("n", "<tab>", ":bnext<CR>", opts)

-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)
-- Move window
map("n", "sh", "<C-w>h")
map("n", "sk", "<C-w>k")
map("n", "sj", "<C-w>j")
map("n", "sl", "<C-w>l")

-- Resize window
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><right>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

-- --- Navigation Fixes ---

-- 1. Scroll and Center (Your existing preference)
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- 2. Force gg to go to the Absolute Top-Left (Line 1, Column 0)
-- We use "1G" (Go to Line 1) + "0" (Go to Column 0) to be extremely precise.
map({ "n", "x" }, "gg", "1G0", { desc = "Go to very top left" })

-- 3. Force G to go to the Absolute Bottom-Right (Last Line, Last Char)
-- We use "G" (Go to Last Line) + "$" (Go to End of Line)
map({ "n", "x" }, "G", "G$", { desc = "Go to very bottom right" })

-- 4. Select All (Consistency check)
map({ "n", "v" }, "<C-a>", "gg0VG$", { desc = "Select all (Top Left to Bottom Right)" })
map("i", "<C-a>", "<Esc>gg0VG$", { desc = "Select all (Top Left to Bottom Right)" })
