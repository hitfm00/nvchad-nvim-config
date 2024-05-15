require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Nvim hop
map("n", "<leader>o", function()
  require("hop").hint_words()
end, { desc = "Hop to char" })

-- lazygit nvim
map("n", "<leader>gg", ":LazyGit<cr>", { desc = "LazyGit" })

-- map("n", "<leader>ff", ":Telescope<cr>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
