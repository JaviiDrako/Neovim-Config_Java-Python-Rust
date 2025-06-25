-- Debug Adapter Protocol client for Neovim provides core debugging functionality 
-- such as launching or attaching to programs, setting breakpoints, stepping through code, 
-- and inspecting program state.  

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Keymaps
      vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "DAP continue" })
      vim.keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end, { desc = "DAP toggle breakpoint" })
      vim.keymap.set("n", "<C-M-i>", function() dap.step_over() end, { desc = "DAP step over" })
      vim.keymap.set("n", "<C-M-o>", function() dap.step_into() end, { desc = "DAP step into" })
      vim.keymap.set("n", "<C-M-p>", function() dap.step_out() end, { desc = "DAP step out" })
      vim.keymap.set("n", "<leader>db", function() dap.set_breakpoint() end, { desc = "DAP set conditional breakpoint" })
      vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, { desc = "DAP open REPL" })
      vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "DAP run last" })
      vim.keymap.set("n", "<leader>dc", function() dap.terminate() end, { desc = "DAP terminate" })

      -- Rust adapter using codelldb
      dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
          -- path to codelldb executable installed by mason or your system
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        }
      }

      dap.configurations.rust = {
        {
          name = "Launch Rust executable",
          type = "codelldb",
          request = "launch",
          program = function()
            -- Prompt for the path to the executable (usually target/debug/<binary>)
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    end,
  },
  {
    -- Python debug plugin
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("python3")
    end,
    ft = "python",
  },
}






