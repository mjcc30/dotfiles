return {
  -- Setup Format and Style with Conform
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- Setting up mason-conform
  -- https://github.com/zapling/mason-conform.nvim
  -- ~/.config/nvim/lua/configs/mason-conform.lua
  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = function()
      require "configs.mason-conform"
    end,
  },
  -- Setup Treesitter
  -- https://github.com/nvim-treesitter/nvim-treesitter
  -- ~/.config/nvim/lua/configs/treesitter.lua
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.treesitter"
    end,
  },

  -- Setup LSPConfig
  -- https://github.com/neovim/nvim-lspconfig
  -- ~/.config/nvim/lua/configs/lspconfig.lua
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Setting up mason-lspconfig
  -- https://github.com/williamboman/mason-lspconfig.nvim
  -- ~/.config/nvim/lua/configs/mason-lspconfig.lua
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
    end,
  },
  -- Setting up Linting
  -- https://github.com/mfussenegger/nvim-lint
  -- ~/.config/nvim/lua/configs/lint.lua
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },
  -- Setting up mason-lint.
  -- https://github.com/rshkarin/mason-nvim-lint
  {
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    config = function()
      require "configs.mason-lint"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
    },
    config = function()
      require "configs.none-ls"
    end,
  },
  -- DAP
  { -- for virtual text
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Creates a beautiful debugger UI
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",

      -- virtual text for the debugger
      "theHamsta/nvim-dap-virtual-text",

      -- Installs the debug adapters for you
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",

      -- Add your own debuggers here
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
      -- "mrcjkb/rustaceanvim",
    },
    config = function()
      require "configs.dap"
    end,
  },
  --
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.mason-dap"
    end,
  },
  --
  "nvzone/volt",
  { "nvzone/showkeys", cmd = "ShowkeysToggle" },
  { "nvzone/timerly", cmd = "TimerlyToggle" },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  --
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    },
  },
  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {}, -- automatically calls `require("lazydocker").setup()`
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>ld", "<cmd>LazyDocker<cr>", desc = "Open lazy docker" },
    },
  },
}
