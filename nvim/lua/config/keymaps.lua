-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<C-f>", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })

-- Normal mode: toggle comment on current line
-- map("n", "<C-_>", "gcc", { desc = "Toggle line comment" })

-- Visual mode: toggle comment on selection
-- map("x", "<C-_>", "gc", { desc = "Toggle selection comment" })

-- Toggle comment in NORMAL mode
-- map("n", "<C-f>", "<leader>sg", { desc = "Live grep" })

-- map("n", "<C-f>", "<leader>ff", { desc = "Telescope find files" })
-- map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Grep Files" })
-- map("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep (Ctrl+F)" })
