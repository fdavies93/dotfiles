function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

function get_stem(full_path)
   local parts = {}
   for v in string.gmatch(full_path,"[^/]+")
   do
      table.insert(parts, v)
   end
   return parts[#parts]
end

-- Add the root init.lua to runtimepath so we can actually find
-- stuff under the config directory
vim.opt.rtp:prepend(script_path())

local plugins = vim.api.nvim_get_runtime_file("plugins/*", true)

-- This lets us get fine-grained control of plugins without resorting
-- to methods like symlinking directories

-- If you use load_all = false then you can vendor in packages and not
-- bother to remove them, just remove them from the include list to disable.
-- On the other hand, you need to maintain a list of plugins you want to
-- enable.

-- If you use load_all = true then plugin folders that aren't explicitly
-- excluded will always be loaded. This can cause unusual behaviour for 
-- some plugins. This requires a more involved approach to managing package
-- installs, but doesn't require you to maintain a list in nvim config.
local load_all = false

local include = {
   "auto-session",
   "mini.nvim",
   "nvim-lspconfig",
   "nvim-treesitter",
   "oil.nvim",
   "oxocarbon",
   "render-markdown",
   "vim-sleuth",
   "nordic",
   "full_visual_line"
}

local exclude = {}

local include_set = {}
for _, v in ipairs(include) do include_set[v] = true end

local exclude_set = {}
for _, v in ipairs(exclude) do exclude_set[v] = true end


for _, v in ipairs(plugins) do
   local stem = get_stem(v)
   if exclude_set[stem] == nil and load_all then
      vim.opt.rtp:append(v)
      -- generate helptags
      if vim.uv.fs_stat(v .. "/doc") then
         vim.cmd.helptags(v .. "/doc")
      end
   end
   if include_set[stem] ~= nil and not load_all then
      vim.opt.rtp:append(v)
      -- generate helptags
      if vim.uv.fs_stat(v .. "/doc") then
         vim.cmd.helptags(v .. "/doc")
      end
   end
end

-- Everything above this line can probably be refactored into its own file
-- or simple plugin

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

-- Helix-style line highlighting
vim.keymap.set("n", "x", "^V$")
vim.keymap.set("v", "x", "j")

vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Built-in method to view diagnostics from LSPs
vim.keymap.set("n", "L", vim.diagnostic.open_float)

-- Very helpful to correct for key bounce / typos
vim.api.nvim_create_user_command("W", "w", {})

vim.o.background = "dark"

require("config.lsps")

require("nvim-treesitter.configs").setup({
   ensure_installed = { "lua", "markdown", "markdown_inline" },
   auto_install = true,
   highlight = {
      enable = true
   },
   additional_vim_regex_highlighting = false
})

require("config.mini")

require("oil").setup()
require("auto-session").setup()
require("render-markdown").setup()

require("nordic").setup({
   swap_backgrounds = true,
})

-- this complements the helix line behaviour and helps with low-contrast
-- highlights like in nordic
require("full_visual_line").setup()

vim.cmd.colorscheme("nordic")
