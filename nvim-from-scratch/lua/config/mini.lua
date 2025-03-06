require("mini.pick").setup()
require("mini.statusline").setup()
require("mini.icons").setup()
require("mini.extra").setup()
require("mini.completion").setup()
require("config.mini-clue")

vim.keymap.set("n", "<leader>fe", MiniExtra.pickers.explorer, { desc = "[F]ind [E]xplorer" })
vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "[F]ind [B]uffer" })
vim.keymap.set("n", "<leader>fh", MiniExtra.pickers.hl_groups, { desc = "[F]ind [H]ighlights" })

-- Setup key mappings for completions
local imap_expr = function(lhs, rhs)
  vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
