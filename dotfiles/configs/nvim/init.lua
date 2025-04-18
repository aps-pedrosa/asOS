-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search Obsidian notes" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Create new Obsidian note" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", { desc = "Open today's daily note" })

-- Rename current Obsidian note
vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>", { desc = "Rename Obsidian note" })

-- Add/edit tags in the current note's frontmatter
vim.keymap.set("n", "<leader>om", "<cmd>ObsidianTags<CR>", { desc = "Edit tags in frontmatter" })
