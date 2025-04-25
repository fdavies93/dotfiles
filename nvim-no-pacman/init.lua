function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

-- Add the root init.lua to runtimepath so we can actually find
-- stuff under the config directory
vim.opt.rtp:prepend(script_path())

plugins = vim.api.nvim_get_runtime_file("plugins/*", true)

for i, v in ipairs(plugins) do
         vim.opt.rtp:append(v)
end


-- An alternative setup to make it easier to control 'installs':
-- To add a plugin, just symlink from the vendored directory
-- to the plugins directory in the folder DIRECTLY above a /lua folder

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = true
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

vim.keymap.set("n", "x", "^v$")
vim.keymap.set("v", "x", "j")
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.api.nvim_create_user_command("W", "w", {})

vim.o.background = "dark"
vim.o.termguicolors = true

require("oxocarbon")
require("oil").setup()
require("auto-session").setup()
require("nvim-treesitter").setup()

require("config.mini")
require("config.lsps")
