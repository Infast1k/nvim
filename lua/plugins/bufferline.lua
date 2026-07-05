return {
  'akinsho/bufferline.nvim',
  event = "VeryLazy",
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { "<leader>bl", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bh", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
    { "<BS>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<CR>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  },
  opts = {
    options = {
      mode = "tabs",
    },
  },
}
