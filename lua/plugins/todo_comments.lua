return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local yellow_color = "#e0a857"

    require("todo-comments").setup({
      colors = {
        error = { yellow_color },
        warning = { yellow_color },
        info = { yellow_color },
        hint = { yellow_color },
        default = { yellow_color },
      },

      keywords = {
        FIX = { color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { color = "info", alt = { "XXX" } },
        HACK = { color = "warning", alt = {} },
        WARN = { color = "warning", alt = { "WARNING" } },
        PERF = { color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { color = "hint", alt = { "INFO", "NOTE" } },
        TEST = { color = "default", alt = { "TESTING", "PASSED", "FAILED" } },
      }
    })

    local keyword_names = { "FIX", "TODO", "HACK", "WARN", "PERF", "NOTE", "TEST" }

    local function apply_todo_style()
      for _, kw in ipairs(keyword_names) do
        vim.api.nvim_set_hl(0, "TodoFg" .. kw, {
          fg = yellow_color, bold = true, italic = true,
        })

        vim.api.nvim_set_hl(0, "TodoBg" .. kw, {
          fg = yellow_color, bold = true, italic = true,
        })
      end
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("TodoCommentsStyle", { clear = true }),
      callback = apply_todo_style,
    })

    vim.schedule(apply_todo_style)
  end,
}
