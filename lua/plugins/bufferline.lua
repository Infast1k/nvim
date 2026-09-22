return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<BS>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  opts = {
    options = {
      mode = "tabs",
      separator_style = "thin",
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_buffer_icons = true,
      color_icons = true,
      always_show_bufferline = false,
      auto_toggle_bufferline = true,
    },
    highlights = {
      buffer_selected = {
        fg = "#FFFFFF",
        bg = "#e0a857",
        bold = true,
      },
    },
  },
}
