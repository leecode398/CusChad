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

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    init = require("core.utils").load_mappings "telescope",

    opts = overrides.telescope,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("plugins.configs.others").luasnip()
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },

    opts = function()
      return require "custom.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    ft = "gitcommit",
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. vim.fn.expand "%:p:h" .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
            vim.schedule(function()
              require("lazy").load { plugins = { "gitsigns.nvim" } }
            end)
          end
        end,
      })
    end,
    opts = function()
      return require("custom.configs.overrides").gitsigns
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
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
  {
    "Pocco81/true-zen.nvim",
    lazy = false,
    config = function()
      require("true-zen").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  },
  { "preservim/tagbar", lazy = false },
  { "ddollar/nerdcommenter", lazy = false },
}

return plugins
