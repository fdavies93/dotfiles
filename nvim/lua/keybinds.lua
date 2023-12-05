-- Universal keybinds.
-- For MacOS / Windows layout specific keybinds, see those files.

-- Global mappings.

vim.g.mapleader = " "
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', 'gn', "<Cmd>bn<CR>", {silent = true})
vim.keymap.set('n', 'gp', "<Cmd>bp<CR>", {silent = true})
vim.keymap.set('n', '<leader>wv', "<Cmd>vsplit<CR>", {silent = true})
vim.keymap.set('n', '<leader>wh', "<Cmd>split<CR>", {silent = true})
vim.keymap.set('n', '<leader>wc', "<Cmd>close<CR>", {silent = true})

vim.keymap.set('n', '<leader><left>', "<C-w><left>")
vim.keymap.set('n', '<leader><right>', "<C-w><right>")
vim.keymap.set('n', '<leader><down>', "<C-w><down>")
vim.keymap.set('n', '<leader><up>', "<C-w><up>")
vim.keymap.set('n', "<leader>x", "<Cmd><CR>")
vim.keymap.set('n', 'U',"<C-R>")
-- Kakoune-style x to select line
vim.keymap.set('n', 'x', "^v$")
vim.keymap.set('v', 'x', "<down>$")

-- Fast scrolling
vim.keymap.set('n', '<M-down>',"4<down>")
vim.keymap.set('n', '<M-up>', "4<up>")
vim.keymap.set('n', '<M-right>', "2e")
vim.keymap.set('n', '<M-left>', "2b")
