local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
local opt = vim.opt
local g = vim.g

g.nofoldenable = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.numberwidth = 4
opt.writebackup = false
opt.expandtab = true -- 将tab转换为空格
opt.cursorline = true -- 高亮当前行
opt.scrolloff = 4 -- vim滚动时保持光标距离屏幕上下边缘的行数
opt.fdm = "syntax"
opt.fileformats = "unix"
g.mapleader = ","
opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding

autocmd("FileType", {
  pattern = "norg",
  callback = function()
    -- vim.opt.laststatus = 0
    opt.number = false
    opt.showtabline = 0
    opt.cole = 1
    opt.foldlevel = 10
  end,
})

-- 退出buffer自动退出nvim-tree
vim.api.nvim_create_autocmd("BufEnter", {
  command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
  nested = true,
})
