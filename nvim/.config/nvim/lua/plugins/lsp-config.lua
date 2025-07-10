return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed =  { "lua_ls", "basedpyright", "ruff", "bashls", "harper_ls", "markdown_oxide", "ts_ls", "emmet_language_server", "superhtml", "cssls"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
      { "gr", vim.lsp.buf.references, desc = "Goto References" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
      { "<C-f>", vim.lsp.buf.format, desc = "Format File" },
    },
    config = function()
      local diagnostics_enabled = true

      local function toggle_diagnostics()
        diagnostics_enabled = not diagnostics_enabled
        vim.diagnostic.config({
          signs = diagnostics_enabled,
        })
        print("Diagnostics signs " .. (diagnostics_enabled and "enabled" or "disabled"))
      end

      -- Bind the function to a key, for example <leader>d
      vim.keymap.set("n", "<leader>d", toggle_diagnostics, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            }
          }
        }
      })


      lspconfig.basedpyright.setup({
        capabilities = lsp_capabilities,
        settings = {
          python = {
            pythonPath = vim.fn.exepath("python"),
          }
        }
      })
      lspconfig.emmet_language_server.setup({})

      lspconfig.ruff.setup({
      })

      lspconfig.ts_ls.setup({
      })

    end,
  },
}

