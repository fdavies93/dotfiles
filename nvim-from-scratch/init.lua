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
vim.opt.inccommand = "split"
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.o.showtabline = 0
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ttimeoutlen = 100

-- helix-style row selections
vim.keymap.set("n", "x", "^v$")
vim.keymap.set("v", "x", "j")
-- redo with U
vim.keymap.set("n", "U", "<C-r>")
-- kill highlights on ESC
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- fix typos / slow key response for save
vim.api.nvim_create_user_command("W", "w", {})
-- open diagnostics (e.g. LSP errors) with L - works well with K for annotations
vim.keymap.set("n", "L", vim.diagnostic.open_float)
vim.diagnostic.config({
        virtual_text = false
})
-- don't close visual mode after indent
vim.keymap.set("v", "<", "<gv$")
vim.keymap.set("v", ">", ">gv$")

require("config.lazy")

vim.cmd.colorscheme("oxocarbon")
vim.o.background = "dark"
vim.o.termguicolors = true
