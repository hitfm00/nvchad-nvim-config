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

-- Github copilot for accept
map("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false }, { desc = "Copilot Accept" })

-- Gihutb copilot for next suggestion
map("i", "<C-L>", "copilot#Next()", { expr = true, silent = true })
map("i", "<C-H>", "copilot#Previous()", { expr = true, silent = true })
map("i", "<C-K>", "copilot#Suggest()", { expr = true, silent = true })

--

-- Delete selected text without yanking
map("v", "d", '"_d', { desc = "Delete without yanking" })

-- map("n", "<leader>ff", ":Telescope<cr>")

-- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
