-- Setup Dracula
vim.cmd[[colorscheme dracula]]

-- Display options
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.g.mapleader = " "

-- Setup bufferline 
vim.opt.termguicolors = true
require("bufferline").setup{}
