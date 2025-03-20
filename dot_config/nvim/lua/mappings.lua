require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-t>", function()
  require("nvchad.themes").open()
end, {})

map("n", "<C-p>", function()
  require("minty.huefy").open()
end, {})

map("n", "<C-m>", function()
  require("menu").open "gitsigns"
end, {})

map({ "n", "v" }, "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local dap = require "dap"
map("n", "<C-b>", function()
  dap.toggle_breakpoint "Debug: Toggle Breakpoint"
end, { desc = "Debug: Set Breakpoint" })
