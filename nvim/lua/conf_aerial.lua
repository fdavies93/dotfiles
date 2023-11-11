require("aerial").setup({
	attach_mode = "global"
})

vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
