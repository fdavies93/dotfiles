local uv = vim.uv
if uv == nil then
	uv = vim.loop
end

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'nvim-tree/nvim-web-devicons'
Plug ('akinsho/bufferline.nvim', { tag = '*' })
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', { tag = '0.1.4' })
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'https://tpope.io/vim/commentary.git'
Plug 'https://github.com/neovim/nvim-lspconfig.git'
Plug ('ms-jpq/coq_nvim', {branch = 'coq'})
Plug ('ms-jpq/coq.artifacts', {branch = 'artifacts'})
Plug ('yaegassy/coc-htmldjango', {['do'] = 'yarn install --frozen-lockfile'})
Plug 'stevearc/aerial.nvim'
Plug ('dccsillag/magma-nvim', { ['do'] = ':UpdateRemotePlugins' })
Plug 'nvim-tree/nvim-tree.lua'

vim.call('plug#end')

require("keybinds")
-- Keyboard layout dependent
local uname = uv.os_uname()

if uname.sysname == "Darwin" then require("keybinds-mac") else require("keybinds-win") end

require("commands")
require("nvim-tree").setup()
require("conf_treesitter")
require("lsps")
require("aesthetic")
require("conf_telescope")
require("conf_aerial")
require("magma")
