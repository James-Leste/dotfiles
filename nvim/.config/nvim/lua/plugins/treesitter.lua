return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "javascript", "python", "json", "ssh_config", "yaml", "bash", "markdown_inline", "c", "gitignore", "helm"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
