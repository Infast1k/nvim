return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { 'VeryLazy' },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
    },
  },
  keys = {
    { "<CR>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<BS>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
  },
}
