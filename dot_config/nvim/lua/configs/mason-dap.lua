require("mason-nvim-dap").setup {
  ensure_installed = {
    "bash",
    "codelldb",
    "php",
    "delve",
    "python",
    "js-debug-adapter",
  },
  automatic_installation = { exclude = {} },
}
