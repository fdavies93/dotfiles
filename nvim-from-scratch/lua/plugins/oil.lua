return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	config = function()
		require("oil").setup({
			keymaps = {
				["<Esc>"] = { callback = "actions.close", mode = "n" }
			}
		})
		vim.keymap.set("n", "<leader>o", "<CMD>Oil --float<CR>", { desc = "[O]il" })
	end
}
