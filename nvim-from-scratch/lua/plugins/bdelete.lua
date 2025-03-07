return {
	'moll/vim-bbye',
	config = function()
		vim.keymap.set("n", "<leader>d", "<CMD>bdelete<CR>", { desc = "[D]elete buffer"})
	end
}
