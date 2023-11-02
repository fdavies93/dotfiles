-- Obsidian-style move line with cmd+up / cmd+down
vim.keymap.set('n', '<C-up>','^v$d<up>^P')
vim.keymap.set('n', '<C-down>','^v$d<down>^P')
