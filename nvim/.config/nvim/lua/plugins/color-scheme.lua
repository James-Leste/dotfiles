return {
  'Mofiqul/vscode.nvim',
  priority = 1000,
  config = function()
    local opts = {
      italic_comments = true,
      underline_links = true,
      group_overrides = {
        -- make cursorline more visible
        -- Enable transparent background
        transparent = true,

        -- Enable italic comment
        italic_comments = true,

        -- Underline `@markup.link.*` variants
        underline_links = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- Apply theme colors to terminal
        terminal_colors = true,
      },
    }
    vim.o.background = 'dark'
    vim.cmd.colorscheme "vscode"
  end,
}
