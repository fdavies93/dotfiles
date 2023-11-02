vim.api.nvim_create_user_command("BClose", function (opts)
	vim.cmd("bp")
	vim.cmd("bd#")
end, {})
