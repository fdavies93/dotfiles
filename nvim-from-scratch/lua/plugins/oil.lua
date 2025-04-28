return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	config = function()
		require("oil").setup({})
		vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "[O]il" })
	end
}
