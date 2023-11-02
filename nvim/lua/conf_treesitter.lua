require'nvim-treesitter.configs'.setup
{
	ensure_installed = { "lua", "vim", "vimdoc", "python", "css", "html", "typescript", "javascript", "astro"},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true
	},
}
