local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'nvim-tree/nvim-web-devicons'
Plug 'https://github.com/neovim/nvim-lspconfig.git'
Plug ('akinsho/bufferline.nvim', { tag = '*' })
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', { tag = '0.1.4' })
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug ('ms-jpq/coq_nvim', {branch = 'coq'})
Plug ('ms-jpq/coq.artifacts', {branch = 'artifacts'})
Plug ('yaegassy/coc-htmldjango', {['do'] = 'yarn install --frozen-lockfile'})
Plug 'https://tpope.io/vim/commentary.git'

vim.call('plug#end')

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.g.mapleader = " "

require('telescope')
-- Setup telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.g.mapleader = " "

require('telescope')
-- Setup telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Setup Dracula
vim.cmd[[colorscheme dracula]]

-- Setup bufferline 
vim.opt.termguicolors = true
require("bufferline").setup{}

local coq = require "coq"
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pylsp.setup {coq.lsp_ensure_capabilities()}
lspconfig.tsserver.setup {coq.lsp_ensure_capabilities()}
lspconfig.marksman.setup {coq.lsp_ensure_capabilities()}
lspconfig.html.setup {coq.lsp_ensure_capabilities()}

vim.cmd("COQnow --shut-up")

require'nvim-treesitter.configs'.setup
{
	ensure_installed = { "lua", "vim", "vimdoc", "python", "css", "html", "typescript", "javascript" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true
	},
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', 'gn', "<Cmd>bn<CR>", {silent = true})
vim.keymap.set('n', 'gp', "<Cmd>bp<CR>", {silent = true})
vim.keymap.set('n', '<leader><left>', "<C-w><left>", {silent = true})
vim.keymap.set('n', '<leader><right>', "<C-w><right>", {silent = true})

-- Kakoune-style x to select line
vim.keymap.set('n', 'x', "^v$")
vim.keymap.set('v', 'x', "<down>$")

-- Obsidian-style move line with cmd+up / cmd+down
vim.keymap.set('n', '<D-up>','^v$d<up>^P')
vim.keymap.set('n', '<D-down>','^v$d<down>^P')

-- Fast scrolling
vim.keymap.set('n', '<M-down>',"4<down>")
vim.keymap.set('n', '<M-up>', "4<up>")
vim.keymap.set('n', '<M-right>', "2e")
vim.keymap.set('n', '<M-left>', "2b")

vim.api.nvim_create_user_command("BClose", function (opts)
	vim.cmd("bp")
	vim.cmd("bd#")
end, {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

