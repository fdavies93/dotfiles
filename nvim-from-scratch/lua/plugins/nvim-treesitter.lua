return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
			use_languagetree = true
		}
	},
	indent = { enable = true }
}
