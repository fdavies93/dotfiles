nvim_treesitter = require'nvim-treesitter.configs'
nvim_treesitter.setup
{
	ensure_installed = { "lua", "vim", "vimdoc", "python", "css", "html", "typescript", "javascript", "astro", "markdown","markdown_inline"},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true
	},
}


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- start expanded
vim.opt.foldlevel = 100
