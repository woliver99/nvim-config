require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- visual mode

map("v", "c", '"+y', { desc = "Copy to system clipboard" })
map("v", "x", '"+x', { desc = "Cut to system clipboard" })
map("v", "d", '"_d', { desc = "Delete without copying" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
