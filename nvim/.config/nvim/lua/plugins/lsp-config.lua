return {
  -- mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  -- mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "basedpyright",
          "ruff",
          "ts_ls",
          "bashls",
          "harper_ls",
          "markdown_oxide"
        }
      })
    end
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function on_attach(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, opts)
      end

      -- automatically configure installed servers
      require("mason-lspconfig").setup_handlers({
        function(server)
          lspconfig[server].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,

        -- Special overrides -----------------------------

        -- lua_ls
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
              }
            }
          })
        end,

        -- basedpyright
        ["basedpyright"] = function()
          lspconfig.basedpyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              python = {
                pythonPath = vim.fn.exepath("python"),
              },
              basedpyright = {
                disableOrganizeImports = true,
                analysis = {
                  typeCheckingMode = "off",
                  diagnosticSeverityOverrides = {
                    reportMissingTypeStubs       = "none",
                    reportMissingParameterType   = "none",
                    reportMissingTypeArgument    = "none",
                    reportMissingReturnType      = "none",
                    reportUnknownParameterType   = "none",
                    reportUnknownArgumentType    = "none",
                    reportUnknownVariableType    = "none",
                    reportUnknownMemberType      = "none",
                    reportUnusedImport           = "none",
                    reportUnusedVariable         = "none",
                  },
                },
              },
            }
          })
        end,
      })
    end
  }
}

