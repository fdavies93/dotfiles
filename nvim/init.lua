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

vim.call('plug#end')

require("lsps")
require("conf_telescope")
require("aesthetic")
require("keybinds")
-- Keyboard layout dependent
require("keybinds-win")
-- require("keybinds-mac")
require("commands")
