return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go", -- Go debug adapter
  },
  config = function()
    local dap = require("dap")
    local keymap = vim.keymap

    -- Keymaps
    keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set conditional breakpoint" })

    keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
    keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
    keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step over" })
    keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
    keymap.set("n", "<leader>dx", dap.terminate, { desc = "Terminate" })
    keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last" })
    keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })

    -- Go config
    require("dap-go").setup({
      dap_configurations = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}", -- debug current file
        },
        {
          type = "go",
          name = "Debug package",
          request = "launch",
          program = "${workspaceFolder}", -- debug package
        },
        {
          type = "go",
          name = "Debug test",
          request = "launch",
          mode = "test",
          program = "${file}", -- debug test file
        },
      },
    })
  end,
}
