return {
  "b0o/incline.nvim",
  dependencies = { "rebelot/kanagawa.nvim" },
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local palette = require("kanagawa.colors").setup().palette

    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = palette.sakuraPink, guifg = palette.sumiInk0 },
          InclineNormalNC = { guifg = palette.sumiInk4, guibg = palette.oldWhite },
        },
      },
      window = { margin = { vertical = 0, horizontal = 1 } },
      hide = {
        cursorline = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
          filename = "[+] " .. filename
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return { { icon, guifg = color }, { " " }, { filename } }
      end,
    })
  end,
}
