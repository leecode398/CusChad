local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },

  -- custom plugins
  { "mbriggs/mark.vim", lazy = false },
  { "github/copilot.vim", branch = "release", lazy = false },
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    lazy = false,
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
      require "custom.configs.toggleterm"
    end,
  },
  {
    "LintaoAmons/scratch.nvim",
    lazy = false,
    config = function()
      require("scratch").setup {
        scratch_file_dir = "~/.cache/scratch",
        filetypes = { "json", "xml", "go", "lua", "log", "py", "sh" },
      }
    end,
  },
  {
    "nvim-orgmode/orgmode",
    lazy = false,
    config = function()
      require "custom.configs.orgmode"
    end,
  },
  { "mrjones2014/dash.nvim", run = "make install", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  {
    "rafamadriz/friendly-snippets",
    lazy = false,
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  { "terryma/vim-multiple-cursors", lazy = false },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
      require "custom.configs.todo-comments"
    end,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require "custom.configs.auto-session"
    end,
  },
  {
    "rmagatti/session-lens",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    lazy = false,
    config = function()
      require("session-lens").setup {--[[your custom config--]]
      }
    end,
  },
}

return plugins
