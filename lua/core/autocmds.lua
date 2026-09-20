vim.api.nvim_set_hl(0, "CustomYankHighlight", { bg = "#3B82F6", fg = "#FFFFFF", bold = true })

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
