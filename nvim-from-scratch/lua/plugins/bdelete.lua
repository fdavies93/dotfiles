return {
	'moll/vim-bbye',
	config = function()
		vim.keymap.set("n", "<leader>d", "<CMD>Bdelete<CR>", { desc = "[D]elete buffer" })
		vim.api.nvim_create_user_command("BdeleteAll", "bufdo :Bdelete", {})
	end
}
