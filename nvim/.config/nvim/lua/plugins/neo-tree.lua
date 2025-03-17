return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1, -- extra padding on left hand side
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
        },
      },
      window = {
        position = "left",
        width = 35,
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    })
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
  end
}
