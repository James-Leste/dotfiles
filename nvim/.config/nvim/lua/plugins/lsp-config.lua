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
        ensure_installed =  { "lua_ls", "basedpyright", "ruff", "ts_ls", "bashls", "harper_ls", "markdown_oxide"}
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
      -- LSP config for Neovim 0.11+

      -- Keymaps & diagnostics toggle
      local diagnostics_enabled = true
      local function toggle_diagnostics()
        diagnostics_enabled = not diagnostics_enabled
        vim.diagnostic.config({
          virtual_text = diagnostics_enabled,
          signs = diagnostics_enabled,
          underline = diagnostics_enabled,
        })
        print("Diagnostics " .. (diagnostics_enabled and "enabled" or "disabled"))
      end

      vim.keymap.set("n", "<leader>d", toggle_diagnostics, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

      -- Common capabilities
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Global on_attach to set up key mappings
      local function my_on_attach(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, opts)
      end

      -- Set defaults
      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = my_on_attach,
      })

      -- Per-server config overrides
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.config('basedpyright', {
        settings = {
          python = {
            pythonPath = vim.fn.exepath("python"),
          },
          basedpyright = {
            disableOrganizeImports = true,
            analysis = {
              typeCheckingMode = "off",
              diagnosticSeverityOverrides = {
                reportMissingTypeStubs = "none",
                reportMissingParameterType = "none",
                reportMissingTypeArgument = "none",
                reportMissingReturnType = "none",
                reportUnknownParameterType = "none",
                reportUnknownArgumentType = "none",
                reportUnknownVariableType = "none",
                reportUnknownMemberType = "none",
                reportUnusedImport = "none",
                reportUnusedVariable = "none",
              },
            },
          },
        },
      })

      -- for servers without extra settings
      vim.lsp.config('emmet_language_server', {})
      vim.lsp.config('ruff', {})
      vim.lsp.config('ts_ls', {})

      -- Enable them
      vim.lsp.enable({
        'lua_ls',
        'basedpyright',
        'emmet_language_server',
        'ruff',
        'ts_ls',
      })

    end,
  },
}

