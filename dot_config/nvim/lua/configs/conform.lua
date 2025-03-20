local options = {
  formatters_by_ft = {
    -- C and C++
    -- c = { "clang-format" },
    -- cpp = { "clang-format" },
    css = { "prettier" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    lua = { "stylua" },
    html = { "prettier" },
    sh = { "shfmt" },
    python = {
      "ruff_fix", -- To fix lint errors. (ruff with argument --fix)
      "ruff_format", -- To run the formatter. (ruff with argument format)
    },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },

  -- formatters = {
  -- -- C & C++
  -- ["clang-format"] = {
  --     prepend_args = {
  --         "-style={ \
  --                 IndentWidth: 2, \
  --                 TabWidth: 2, \
  --                 UseTab: Never, \
  --                 AccessModifierOffset: 0, \
  --                 IndentAccessModifiers: true, \
  --                 PackConstructorInitializers: Never}",
  --     },
  -- },
  -- -- Golang
  -- ["goimports-reviser"] = {
  --     prepend_args = { "-rm-unused" },
  -- },
  -- golines = {
  --     prepend_args = { "--max-len=80" },
  -- },
  -- -- Lua
  -- stylua = {
  --     prepend_args = {
  --         "--column-width", "80",
  --         "--line-endings", "Unix",
  --         "--indent-type", "Spaces",
  --         "--indent-width", "2",
  --         "--quote-style", "AutoPreferDouble",
  --     },
  -- },
  -- -- Python
  -- black = {
  --     prepend_args = {
  --         "--fast",
  --         "--line-length",
  --         "80",
  --     },
  -- },
  -- isort = {
  --     prepend_args = {
  --         "--profile",
  --         "black",
  --     },
  -- },
  -- },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
