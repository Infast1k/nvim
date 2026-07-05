vim.api.nvim_set_hl(0, "CustomYankHighlight", {
    bg = "#f9e2af",
    fg = "#1e1e2e",
    bold = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight selection on yank",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank {
      higroup = "CustomYankHighlight",
      timeout = 150,
    }
  end,
})
