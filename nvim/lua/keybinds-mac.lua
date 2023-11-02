-- Obsidian-style move line with cmd+up / cmd+down
vim.keymap.set('n', '<D-up>','^v$d<up>^P')
vim.keymap.set('n', '<D-down>','^v$d<down>^P')
