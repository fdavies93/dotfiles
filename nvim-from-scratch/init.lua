vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.o.colorcolumn = "80,100"
vim.opt.undofile = true
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.list = true

require("config.lazy")
require("config.mini")

vim.keymap.set("n", "<leader>d", "<CMD>bdelete<CR>", { desc = "[D]elete buffer"})

vim.cmd.colorscheme("oxocarbon")
vim.o.background = "dark"
vim.o.termguicolors = true
