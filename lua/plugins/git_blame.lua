return {
  "Yu-Leo/blame-column.nvim",
  cmd = "BlameColumnToggle",
  keys = {
    { "<leader>gb", "<cmd>BlameColumnToggle<cr>", desc = "Toggle blame column" },
  },
  opts = {
    side = "left",
    dynamic_width = true,
    auto_width = true,
    max_width = -1,
    datetime_format = "%Y-%m-%d %H:%M",
    relative_dates = true,
    window_opts = {
      wrap = false,
      number = false,
      relativenumber = false,
      cursorline = false,
    },
  },
}
