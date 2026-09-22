return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "ruff" },
      },
    })

    local function find_git_root(file_path)
      if file_path == "" then
        return nil
      end

      local file_dir = vim.fn.fnamemodify(file_path, ":p:h")
      local git_markers = vim.fs.find(".git", { path = file_dir, upward = true })

      if #git_markers == 0 then
        return nil
      end

      return vim.fn.fnamemodify(git_markers[1], ":h")
    end

    local function get_git_changed_ranges(file_path)
      local repo_root = find_git_root(file_path)
      if not repo_root then
        return nil
      end

      local cmd =
        string.format("git -C %s diff --unified=0 -- %s", vim.fn.shellescape(repo_root), vim.fn.shellescape(file_path))

      local diff_output = vim.fn.systemlist(cmd)
      if vim.v.shell_error ~= 0 then
        return nil
      end

      local ranges = {}
      for _, line in ipairs(diff_output) do
        if line:find("^@@") then
          local first_str, count_str = line:match("%+(%d+),?(%d*)")
          if first_str then
            local start_line = tonumber(first_str)
            local line_count = tonumber(count_str) or 1

            if start_line > 0 and line_count > 0 then
              table.insert(ranges, {
                start = { start_line, 0 },
                ["end"] = { start_line + line_count - 1, 0 },
              })
            end
          end
        end
      end

      return ranges
    end

    local function format_git_changed(bufnr)
      bufnr = bufnr or vim.api.nvim_get_current_buf()
      local file_path = vim.api.nvim_buf_get_name(bufnr)

      local ranges = nil
      if file_path ~= "" and vim.fn.filereadable(file_path) == 1 then
        ranges = get_git_changed_ranges(file_path)
      end

      -- Нет диапазонов (нет Git / нет изменений / новый файл) — форматируем всё
      if not ranges or #ranges == 0 then
        return
      end

      -- Форматируем только изменённые диапазоны, снизу вверх,
      -- чтобы изменения в нижних строках не сдвигали нумерацию верхних.
      for i = #ranges, 1, -1 do
        conform.format({
          bufnr = bufnr,
          range = ranges[i],
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end
    end

    -- format only git diff lines
    vim.keymap.set({ "n", "v" }, "<leader>cfg", function()
      format_git_changed()
    end, { desc = "Format Git-changed lines" })

    -- format whole file or selected lines
    vim.keymap.set({ "n", "v" }, "<leader>cfs", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
