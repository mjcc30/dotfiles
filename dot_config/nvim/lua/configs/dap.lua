local dap = require "dap"
local dapui = require "dapui"
-- virtual text for the debugger
-- require("nvim-dap-virtual-text").setup()
-- Set up icons.
local icons = {
  Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint = " ",
  BreakpointCondition = " ",
  BreakpointRejected = { " ", "DiagnosticError" },
  LogPoint = ".>",
}
for name, sign in pairs(icons) do
  sign = type(sign) == "table" and sign or { sign }
  vim.fn.sign_define(
    "Dap" .. name,
    { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
  )
end

-- Dap UI setup
-- default setup
-- dapui.setup()
-- For more information, see |:help nvim-dap-ui|
dapui.setup {
  -- Set icons to characters that are more likely to work in every terminal.
  --    Feel free to remove or use ones that you like more! :)
  --    Don't feel like these are good choices.
  icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
}

-- makes nvim-dap work w/ .vscode/launch.json files
require("dap.ext.vscode").load_launchjs(nil, {})

-- DAP keymap
local map = vim.keymap.set
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle DAP Breakpoint" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue DAP" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })

-- DAP listeners
dap.listeners.after.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.after.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- configure codelldb adapter
dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb",
}

dap.configurations = {
  bashdb = {
    type = "executable",
    command = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
    name = "bashdb",
  },
  c = {
    {
      name = "codelldb launch",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: " .. vim.fn.getcwd() .. "/")
      end,
      cwd = "${workspaceFolder}",
      terminal = "integrated",
      stopOnEntry = false,
    },
    {
      name = "codelldb attach",
      type = "codelldb",
      request = "attach",
      pid = function()
        return vim.fn.input "pid: "
      end,
      cwd = "${workspaceFolder}",
      terminal = "integrated",
      stopOnEntry = false,
      waitFor = true,
    },
  },
  go = {
    {
      type = "go", -- Which adapter to use
      name = "Debug", -- Human readable name
      request = "launch", -- Whether to "launch" or "attach" to program
      program = "${file}", -- The buffer you are focused on when running nvim-dap
    },
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    },
    {
      type = "go",
      name = "Attach (Pick Process)",
      mode = "local",
      request = "attach",
      processId = require("dap.utils").pick_process,
    },
    {
      type = "go",
      name = "Attach (127.0.0.1:9080)",
      mode = "remote",
      request = "attach",
      port = "9080",
    },
  },
  javascript = {
    {
      type = "node2",
      name = "Launch",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      type = "node2",
      name = "Attach",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
  },
  lua = {
    {
      type = "nlua",
      request = "attach",
      name = "Attach to running Neovim instance",
    },
  },
  zig = {
    {
      name = "Launch",
      type = "codelldb",
      request = "launch",
      program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    },
  },
}
dap.configurations.rust = dap.configurations.c
-- Python
local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(path)

map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Run DAP Python test method" })

-- Go
require("dap-go").setup()

-- JS
-- dap.adapters["pwa-node"] = {
--   type = "server",
--   host = "127.0.0.1",
--   port = 8123,
--   executable = {
--     command = "js-debug-adapter",
--   },
-- }

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      -- runtimeExecutable = "node",
      sourceMaps = true,
    },
  }
end
