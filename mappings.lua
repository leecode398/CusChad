---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>cc"] = "",
  },
}
M.general = {
  n = {
    ["<leader>tb"] = { "<cmd> TagbarToggle <CR>", "toggle tagbar" },
    ["<leader>w"] = { "<cmd> HopWord <CR>", "toggle tagbar" },
    ["f"] = { "<cmd> HopChar1CurrentLineAC <CR>", "find after" },
    ["F"] = { "<cmd> HopChar1CurrentLineBC <CR>", "find before" },
    ["za"] = { "<cmd> HopChar2 <CR>", "find anywhere" },
    ["zz"] = { "<cmd> HopChar1 <CR>", "find anywhere" },
    ["gl"] = { "<cmd> LspRestart <CR>", "restart lsp" },
  },
  v = {
    ["f"] = { "<cmd> HopChar1CurrentLineAC <CR>", "find after" },
    ["F"] = { "<cmd> HopChar1CurrentLineBC <CR>", "find before" },
  },
}

M.truzen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
  },
}

M.shade = {
  n = {
    ["<leader>s"] = {
      function()
        require("shade").toggle()
      end,

      "   toggle shade.nvim",
    },
  },
}

M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<C-j>"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "   lsp definition",
    },
  },
}

M.telescope = {
  i = {
    ["<C-j>"] = { "<Down>", " move down" },
    ["<C-k>"] = { "<Up>", " move up" },
  },
  n = {
    -- find
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "  find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
    ["<leader>g"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>a"] = { "<cmd> Telescope grep_string <CR>", "   grep string" },
    ["<C-b>"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },

    -- lsp
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "lsp references" },
    ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "lsp definitions" },
    ["gi"] = { "<cmd> Telescope lsp_implementations <CR>", "lsp implementations" },
    ["gt"] = { "<cmd>Telescope lsp_type_definitions <CR>", "lsp type_definition" },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    [";a"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },

    -- focus
    [";e"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
  },
}

vim.api.nvim_set_keymap("", "H", "^", { silent = true })
vim.api.nvim_set_keymap("", "L", "$", { silent = true })
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { silent = true })
vim.api.nvim_set_keymap("i", "jk", "<ESC>:w<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "q", ":q<CR>", { silent = true })
vim.api.nvim_set_keymap("v", "q", "<ESC>:q<CR>", { silent = true })
vim.keymap.set("n", ",t", function()
  require("scratch").scratch()
end)
vim.keymap.set("n", ",f", function()
  require("scratch").fzfScratch()
end)
vim.keymap.set("n", ",m", function()
  require("scratch").scratchWithName()
end)
vim.keymap.set("n", ",o", function()
  require("scratch").openScratch()
end)
vim.api.nvim_set_keymap("n", "<C-\\>", ":%s/\\//g<CR>", { silent = true })

return M
