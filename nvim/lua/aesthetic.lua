-- Setup Dracula
vim.cmd[[colorscheme monokai-pro-spectrum]]

-- Display options
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.foldmethod = "expr"
vim.opt.textwidth = 80

vim.g.mapleader = " "

-- Setup bufferline 
vim.opt.termguicolors = true
require("bufferline").setup{}

