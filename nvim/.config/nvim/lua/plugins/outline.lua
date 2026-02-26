return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    outline_window = {
      width = 30,
      relative_width = true,
      auto_width = {
        enable = true,
        max_width = 40,
        include_symbol_details = false,
      },
      auto_jump = true,
      wrap = true,
    }    -- Your setup opts here
  },
}

