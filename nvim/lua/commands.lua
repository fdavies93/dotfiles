vim.api.nvim_create_user_command("BClose", function (opts)
	vim.cmd("bp")
	vim.cmd("bd#")
end, {})

vim.keymap.set('n', '<leader>c',"<Cmd>BClose<CR>", {silent = true})

