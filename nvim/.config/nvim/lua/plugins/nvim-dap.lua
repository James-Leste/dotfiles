return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
      require("dap-go").setup()
      require("dap-python").setup("python")

      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set("n", "dt", ":DapToggleBreakpoint<CR>")
      vim.keymap.set("n", "dc", ":DapContinue<CR>")
      vim.keymap.set("n", "dx", ":DapTerminate<CR>")
      vim.keymap.set("n", "do", ":DapStepOver<CR>")
      vim.keymap.set("n", "di", ":DapStepInto<CR>")

    end,
  }
}
