require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', '<leader>s', ':SaveWithoutFormat<CR>', { desc = "Save without formatting" })
map('n', '<leader>q', ':qa<CR>', { desc = "Exit editor" })
