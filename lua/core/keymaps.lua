vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right split' })
keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left split' })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to bottom split' })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to top split' })

keymap.set('n', '<leader>bn', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
keymap.set('n', '<leader>bx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
keymap.set('n', '<leader>bc', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
