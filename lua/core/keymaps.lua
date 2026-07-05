local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>bn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>bc", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
keymap.set("n", "<leader>bx", "<cmd>tabclose<CR>", { desc = "Close current tab" })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Jump to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Jump to bottom split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Jump to top split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Jump to right split" })

vim.keymap.set('n', 'j', 'gj', { desc = 'Move down by visual line' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Move up by visual line' })
vim.keymap.set('v', 'j', 'gj', { desc = 'Move down by visual line' })
vim.keymap.set('v', 'k', 'gk', { desc = 'Move up by visual line' })

vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and keep selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and keep selection' })

vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without overwriting register' })
