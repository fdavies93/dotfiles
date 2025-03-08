return {
	'moll/vim-bbye',
	config = function()
		vim.keymap.set("n", "<leader>d", "<CMD>Bdelete<CR>", { desc = "[d]elete buffer" })
		vim.keymap.set("n", "<leader>D", "<CMD>bufdo :Bdelete<CR>", { desc = "[D]elete ALL buffers" })
		vim.api.nvim_create_user_command("BdeleteAll", "bufdo :Bdelete", {})
	end
}
